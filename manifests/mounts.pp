class lancache::mounts {

  # ensure lancache storage mountpoint exists
        file { ['/mnt/lancache']:
                ensure => directory,
    owner              => 'nginx',
    group              => 'nginx',
    mode               => '0755',
        }

        file { ['/mnt/lancache/cache']:
          ensure => directory,
          owner  => 'nginx',
          group  => 'nginx',
          mode   => '0755',
        }

  file { '/data/www':
    ensure  => link,
    target  => '/mnt/lancache',
    require => File['/data'],
  }

  file { '/data':
    ensure => directory,
  }

  # mount lvm volume at lancache mount point
  mount { 'lancache':
    name    => '/mnt/lancache',
    ensure  => 'mounted',
    device  => '/dev/mapper/flashcache',
    fstype  => 'ext3',
    options => 'noatime,defaults',
    require => File['/mnt/lancache'],
  }
}
