class lancache::nginx-conf {

  # copy the nginx.conf
  # notify the service
  
#	file { '/etc/nginx/nginx.conf':
#		source => 'puppet:///modules/lancache/nginx.conf',
#		notify => Service['nginx'],
#		require => Package['nginx'],
#	}

  file { '/etc/nginx/':
    source  => 'puppet:///modules/lancache/lancache-386/',
    notify  => Service['nginx'],
    recurse => true,
    require => [ Package['nginx'], File['/etc/yum.repos.d/nginx.repo'] ],
  }
  

  # create the directories
  file { '/usr/local/lancache':
    target  => '/mnt/lancache',
    ensure  => link,
    force   => true,
    owner   => 'nginx',
    group   => 'nginx',
    mode    => '0755',
    require => Mount['lancache']
  }
    
  file { ['/usr/local/lancache/logs', '/usr/local/lancache/data', '/usr/local/lancache/steamproxy']:
    ensure  => directory,
    owner   => 'nginx',
    group   => 'nginx',
    mode    => '0755',
    require => File['/usr/local/lancache']
  }

}
