class hubot_dev {
  class { 'irc':
    network_name  => 'irc.hubot_dev.local',
    network_desc  => 'hubot dev server',
    admin_name    => 'Your Mom',
    admin_email   => 'happiness@betweenherlegs.com',
    operator_name => 'admin',
    operator_pass => 'hubot_dev',
    listen_ip     => $::ipaddress,
  }

  include git
  class { 'nodejs_squeeze': }
  -> class { 'hubot':
      adapter => 'irc',
      irc_nickname => 'crunchy',
      irc_server   => $::ipaddress,
      irc_rooms    => ['#soggies'],
  }
}
