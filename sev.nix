{ config, pkgs, ... }:

{
  services.udev.extraRules = ''KERNEL=="sev", MODE="0666"'';

  boot.kernelPatches = [{
    name = "kvm-amd-sev";
    patch = null;
    extraConfig = ''
          CRYPTO_DEV_CCP y
          CRYPTO_DEV_CCP_DD m
          CRYPTO_DEV_SP_PSP y
          KVM_AMD_SEV y
          '';
  }];
}
