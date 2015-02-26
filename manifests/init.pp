class lancache {
  include lancache::nginx-conf
  include lancache::packages
  include lancache::services
  include lancache::mounts
}
