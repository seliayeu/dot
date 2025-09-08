{
  config,
  pkgs,
  ...
}:
{
  programs.tiny = {
    enable = true;
    settings = {
      servers = [
        {
          addr = "irc.oftc.net";
          port = 6697;
          tls = true;
          realname = "dan";
          nicks = [ "dotuncle" ];
          join = [ "#tiny" ];
          nickserv_ident = {
            command = ''pass show "irc/oftc-dotuncle"'';
          };
        }
        {
          addr = "irc.libera.chat";
          port = 6697;
          tls = true;
          realname = "dan";
          nicks = [ "dotuncle" ];
          join = [ "#lobsters #tmux #soju #neovim" ];
          sasl = {
            username = "dotuncle";
            password = {
              command = ''pass show "irc/liberachat-dotuncle"'';
            };
          };
        }
        {
          addr = "vancouver-ca.newnet.net";
          port = 6697;
          tls = true;
          realname = "dan";
          nicks = [ "dotuncle" ];
          join = [ "#meta #club #tildetel" ];
          sasl = {
            username = "dotuncle";
            password = {
              command = ''pass show "irc/newnet-dotuncle"'';
            };
          };
        }
        {
          addr = "irc.tilde.chat";
          port = 6697;
          tls = true;
          realname = "dan";
          nicks = [ "dotuncle" ];
          join = [ "#meta #team" ];
          sasl = {
            username = "dotuncle";
            password = {
              command = ''pass show "irc/tildechat-dotuncle"'';
            };
          };
        }
      ];
      layout = "aligned";
      defaults = {
        nicks = [ "dotuncle" ];
        realname = "dan";
        join = [];
        tls = false;
      };
    };
  };
}
