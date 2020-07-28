server '18.181.125.246', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/fujita/.ssh/id_rsa'