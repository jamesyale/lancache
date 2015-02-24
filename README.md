puppet-lancache
===============

Puppet module for Multiplay's excellent lancache (http://blog.multiplay.co.uk/2014/04/lancache-dynamically-caching-game-installs-at-lans-using-nginx/).

Puppetized for the BIG GAME (https://thebiggame.org) LAN party to run on Linux rather than FreeBSD. 

Tested on CentOS 6.

Usage
-----

* Get a copy of the files in this repo
* Put it into puppet in the approperiate environment (or just /etc/puppet/modules if you don't use environments)
* Edit mounts.pp to match your environment (hint, should only be the device attribute)
* Include the class in your node definition
* ???
* profit!
