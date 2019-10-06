{ config, lib, ... }:

with lib;

{
  imports = [ ./base.nix ];

  options.submodule = {
    name = mkOption {
      description = "Module name";
      type = types.str;
    };

    description = mkOption {
      description = "Module description";
      type = types.str;
      default = "";
    };

    version = mkOption {
      description = "Module version";
      type = types.str;
      default = "1.0.0";
    };

    tags = mkOption {
      description = "List of submodule tags";
      type = types.listOf types.str;
      default = [];
    };

    passthru = mkOption {
      description = "Attribute set to passthru";
      default = {};
      type = types.attrs;
    };

    args._empty = mkOption {};
  };

  config._module.features = ["submodule"];
  config._module.args.args = config.submodule.args;
}
