{ config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        libinput
    ];

    services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="input", ENV{LIBINPUT_ATTR_ACCEL_PROFILE}="adaptive", ENV{LIBINPUT_ATTR_ACCEL_SPEED}="0.1"
    '';

    services.libinput = {
        enable = true;
        touchpad = {
            accelProfile = "adaptive"; # or flat
            accelSpeed = "0.5"; # Only for flat and adaptive profiles

            # accelProfile = "custom";

            # accelStepMotion  = 0.02; 
            # accelPointsMotion = [ 0.0 0.1 0.3 0.6 1.0 ];

            scrollMethod = "twofinger";
            naturalScrolling = true;

            # accelStepScroll = 0.05;
            # accelPointsScroll = [ 0.0 0.005 0.01 0.02 0.05 0.15 0.3 0.6 1.0 ];
        };
    };
}
