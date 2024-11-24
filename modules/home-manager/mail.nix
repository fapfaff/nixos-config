{ config, pkgs, lib, ... }:

{
  programs.thunderbird = {
    enable = true;
    profiles = {
      Outlook.isDefault = true;
      Gmail.isDefault = false;
      HM.isDefault = false;
    };
  };

  accounts.email.accounts = {
    Outlook = {
      address = "fabian-pfaff@outlook.de";
      realName = "Fabian Pfaff";
      flavor = "outlook.office365.com";

      primary = true;
      thunderbird = {
        enable = true;
        settings = id: {
          # Enable OAuth2 authentication
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
          "mail.server.server_${id}.authMethod" = 10;
        };
      };    };

    Gmail = {
      address = "fabian.1.pfaff@gmail.com";
      realName = "Fabian Pfaff";
      flavor = "gmail.com";

      thunderbird = {
        enable = true;
        settings = id: {
          # Enable OAuth2 authentication
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
          "mail.server.server_${id}.authMethod" = 10;
        };
      };
    };

    HM = {
    address = "fabian.pfaff@hm.edu";
      realName = "Fabian Pfaff";
      userName = "hm-fpfaff";

      flavor = "plain";
      imap = {
        host = "xmail.mwn.de";
        port = 993;
        tls = {
          enable = true;
          useStartTls = false;
        };
      };
      smtp = {
        host = "postout.lrz.de";
        port = 587;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };

      thunderbird.enable = true;
    };
  };
}
