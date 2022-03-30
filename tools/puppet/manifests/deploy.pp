node 'puppetagent.local' {
  class { 'docker':
    docker_users => ['vagrant'],
  }

  exec { 'apt-update':
    command => '/usr/bin/apt-get update -y'
  }

  package { 'git':
    require => Exec['apt-update'],
    ensure => installed,
  }

  exec { 'git-clone':
    require => Package['git'],
    command => '/usr/bin/git clone https://access-token:glpat-CzRR-GWhMuzydztPPV47@gitlab.com/kdg-ti/the-lab/teams/goeie-vraag/dotnetapp.git'
  }

  docker::image { 'dotnetapp':
    docker_dir => './dotnetapp',
  }
  
  exec { 'run-dotnetapp':
    require => Docker::Image['dotnetapp'],
    command => '/usr/bin/docker run -d -p 5000:5000 -e ASPNETCORE_ENVIRONMENT="Development" dotnetapp',
  }
}