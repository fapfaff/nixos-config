# Tailscale NixOS Module
#
# First-time Setup / Initial Login:
#
# Option A: Interactive Web Browser Login (Recommended for personal machines)
# 1. Run the command:
#      sudo tailscale up
# 2. Open the URL provided in the terminal output in your browser and log in.
# 3. Once authenticated, state is saved to /var/lib/tailscale/tailscaled.state.
#    Subsequent boots will automatically reconnect via the autoconnect service.
#
# Option B: Automated Auth Key (Recommended for headless/unattended setups)
# 1. Generate an auth key at: https://login.tailscale.com/admin/settings/keys
# 2. Save the key into /var/lib/tailscale/key (or /etc/tailscale/authkey):
#      echo "tskey-auth-..." | sudo tee /var/lib/tailscale/key
#      sudo chmod 600 /var/lib/tailscale/key
# 3. Reboot or run:
#      sudo systemctl start tailscale-autoconnect
#

{ config, pkgs, lib, ... }:

{
  # Enable Tailscale service and open firewall for peer-to-peer connections
  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = "client";
    extraUpFlags = [
      "--accept-routes"
      "--operator=fp"
    ];
  };

  # Ensure tailscale CLI package is installed
  environment.systemPackages = with pkgs; [
    tailscale
  ];

  # Automatic connection service on boot
  systemd.services.tailscale-autoconnect = {
    description = "Automatic connection to Tailscale network";
    after = [ "network-online.target" "tailscaled.service" ];
    wants = [ "network-online.target" "tailscaled.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      # Wait up to 30 seconds for tailscaled daemon to be responsive
      for i in $(seq 1 30); do
        if ${pkgs.tailscale}/bin/tailscale status >/dev/null 2>&1; then
          break
        fi
        sleep 1
      done

      # Check current status
      status=$(${pkgs.tailscale}/bin/tailscale status --json | ${pkgs.jq}/bin/jq -r .BackendState 2>/dev/null || echo "Unknown")

      if [ "$status" = "Running" ]; then
        echo "Tailscale is already connected and running."
        exit 0
      fi

      # Check for an auth key file
      AUTH_KEY_FILE=""
      if [ -f "/var/lib/tailscale/key" ]; then
        AUTH_KEY_FILE="/var/lib/tailscale/key"
      elif [ -f "/etc/tailscale/authkey" ]; then
        AUTH_KEY_FILE="/etc/tailscale/authkey"
      fi

      if [ -n "$AUTH_KEY_FILE" ]; then
        echo "Authenticating Tailscale using auth key file: $AUTH_KEY_FILE"
        ${pkgs.tailscale}/bin/tailscale up --authkey="file:$AUTH_KEY_FILE" --accept-routes --operator=fp
      else
        echo "Bringing Tailscale up..."
        ${pkgs.tailscale}/bin/tailscale up --accept-routes --operator=fp
      fi
    '';
  };
}
