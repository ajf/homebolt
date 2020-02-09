plan profiles::linux(
  TargetSpec $targets,
) {
  $targets.apply_prep

  apply($targets) {
    include lookup('puppet_classes')

    # Switch to systemd-timesyncd
    service { 'ntp':
      ensure => stopped,
    } -> package { 'ntp':
      ensure => purged,
      before => Class['systemd'],
    }
  }
}
