#!/usr/bin/env bash
set -euo pipefail


DOTFILES_GIT="https://github.com/jurmarcus/dotfiles.git"
DOTFILES_DIR="${HOME}/dotfiles"
STOW_TARGET="${HOME}"

echo ">> Step 0: Ensure Xcode Command Line Tools"
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install || true
  echo "If a GUI prompt appeared, complete it, then re-run this script."
fi

echo ">> Step 1: Install Homebrew (if missing)"
if ! command -v brew >/dev/null 2>&1; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ -x /opt/homebrew/bin/brew ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

echo ">> Step 2: Install GNU Stow (via brew)"
brew install stow

echo ">> Step 3: Clone or update dotfiles repo"
if [[ -d "${DOTFILES_DIR}/.git" ]]; then
  echo "Repo exists at ${DOTFILES_DIR}; pulling latest…"
  git -C "${DOTFILES_DIR}" pull --ff-only
else
  git clone "${DOTFILES_GIT}" "${DOTFILES_DIR}"
fi

echo ">> Step 4: Stow everything in repo root (first-level dirs only)"
pushd "${DOTFILES_DIR}" >/dev/null
shopt -s nullglob
for d in */; do
  case "$d" in
    .git*/|scripts*/|bin*/|images*/|docs*/|.github*/|private*/ ) continue ;;
  esac
  echo "Stowing: ${d%/}"
  stow --target="${STOW_TARGET}" "${d%/}"
done
popd >/dev/null

echo ">> Step 5: Homebrew Bundle (global)"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_ANALYTICS=1
brew bundle --global

echo "✅ Done. Open a new shell so your shellrc/zprofile changes take effect."
