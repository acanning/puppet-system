# class that defines manipulation of the NTPD options in sysconfig
class system::sysconfig::ntpd (
  $config   = undef,
  $schedule = undef,
) {
  if $config {
    $ntpd = $config
  }
  else {
    $ntpd = hiera_hash('system::sysconfig::ntpd', undef)
  }
  if $ntpd {
    system::sysconfig::header { 'ntpd':
      schedule => $schedule,
    }
    system::sysconfig::entry { 'ntpd-options':
      file     => 'ntpd',
      var      => 'OPTIONS',
      val      => $ntpd['options'],
      schedule => $schedule,
    }
  }
}

