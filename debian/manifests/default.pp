# -*- mode: ruby -*-
# vi: set ft=ruby :

exec { 'Update-apt' :
         command => 'apt-get update',
       provider => shell,
       timeout => 600,
}

$packages = [
  'build-essential',
  'haveged',            # Used to generate randomness for security operations
  'python3',
  'python3-pip',
  'shellcheck',         # Static analyser for bash scripts
  'LightDM',
  'xfce4',
  'virtualbox-guest-dkms',
  'virtualbox-guest-utils',
  'virtualbox-guest-x11',
  'chromium',
  'git',
  'tig',
  'emacs24',
  'handbrake-cli',
  'tmux',
  'apt-transport-https',
  'ca-certificates',
  'curl',
  'gnupg2',
  'software-properties-common',
]

package { $packages :
ensure => present,
       require => Exec['Update-apt'],
}

exec { 'Install Docker Community Edition (CE)':
         command => 'curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - ;
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" ;
apt-get update ;
apt-get -y install docker-ce ;',
       path => ['/usr/local/sbin', '/usr/sbin', '/sbin', '/usr/bin/', '/bin'],
       unless => 'which docker',
              require => [
                package['apt-transport-https'],
                package['curl'],
                package['gnupg2'],
                package['software-properties-common'],
              ]
}
