class lancache::services {

  service { 'nginx':
    ensure  => running,
    require => File['/usr/local/lancache', '/usr/local/lancache/logs', '/usr/local/lancache/data'],
  }
}
