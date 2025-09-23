# ~/.Brewfile
require "socket"
require "pathname"
require "set"

def cfg_home
  Pathname(ENV["XDG_CONFIG_HOME"].to_s.empty? ? File.join(Dir.home, ".config") : ENV["XDG_CONFIG_HOME"])
end

BREW_DIR        = cfg_home.join("brew")
HOSTS_DIR       = BREW_DIR.join("hosts")
MODULES_DIR     = BREW_DIR.join("modules")

def detect_host
  h = `scutil --get HostName 2>/dev/null`.strip
  h = `scutil --get ComputerName 2>/dev/null`.strip if h.empty?
  h = Socket.gethostname if h.empty?
  h.downcase.gsub(/\s+/, "-")
rescue
  Socket.gethostname.downcase
end

HOST = (ENV["HOST_OVERRIDE"] && ENV["HOST_OVERRIDE"].downcase) || detect_host

# Evaluate a brewfile *inside* the Homebrew Bundle DSL
def include_brewfile(path)
  instance_eval(File.read(path), path.to_s)
end

# Module registry to avoid double-including
ENABLED_MODULES = Set.new

# Public helper used by host files to enable modules
def enable(mod_name)
  key = mod_name.to_s.strip.gsub(%r{^/+|/+$}, "")
  return if key.empty? || ENABLED_MODULES.include?(key)

  path = MODULES_DIR.join("#{key}.brew")
  unless path.file?
    # allow directory default: modules/foo -> modules/foo/default.brew
    alt = MODULES_DIR.join(key, "default.brew")
    path = alt if alt.file?
  end

  if path.file?
    puts "➕ enable #{key} (#{path})"
    ENABLED_MODULES << key
    include_brewfile(path)
  else
    raise "Module not found: #{key} (looked for #{MODULES_DIR}/#{key}.brew and #{MODULES_DIR}/#{key}/default.brew)"
  end
end

def include_if_exists(path)
  p = Pathname(path)
  include_brewfile(p) if p.file?
end

host_file = HOSTS_DIR.join("#{HOST}.brew")
if host_file.file?
  include_brewfile(host_file)
else
  warn "⚠️ No host profile for #{HOST} (#{host_file}) — only shared modules loaded."
end
