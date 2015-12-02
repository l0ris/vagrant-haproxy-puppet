node 'lb.local' {
  class { 'haproxy': }
  haproxy::listen { 'mybpool':
  collect_exported => false,
  ipaddress => '*',
  ports => '80',
  options => {'option' => ['tcplog','httpchk HEAD / HTTP/1.0'],'balance' => ['roundrobin']}
}

  haproxy::balancermember { 'nginx-1':
    listening_service => 'mypool',
    server_names      => 'nginx-1.local',
    ipaddresses       => '192.168.11.11',
    ports             => '80',
    options           => 'check'
  }
  haproxy::balancermember { 'nginx-2':
    listening_service => 'mypool',
    server_names      => 'nginx-1.local',
    ipaddresses       => '192.168.11.12',
    ports             => '80',
    options           => 'check'
  }
}
