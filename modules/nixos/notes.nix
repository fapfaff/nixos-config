{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    trilium-next-desktop
  ];
}
