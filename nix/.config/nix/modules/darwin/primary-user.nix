{ config, lib, ... }:
{
  options.my.primaryUser = lib.mkOption {
    type = lib.types.str;
    default = "methylene";
    description = "The primary user of the host";
  };
}
