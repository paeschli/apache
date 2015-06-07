class apache {

  $app_name = hiera('apache::app_name', 'liens')

  package { 'httpd':
    ensure => installed,
  }

  service { 'httpd':
    require => Package['httpd'],
    ensure => running,
  }

  file { "/etc/httpd/${app_name}.vhost":
    ensure => file,
    content => template('apache/apache.vhost.erb'),
    owner   => root,
    group   => root,
    mode    => 644,
    require => Package['httpd'],        # require 'apache2' package before creating
  }

}
