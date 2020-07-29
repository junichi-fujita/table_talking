server '54.150.197.222', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/fujita/.ssh/id_rsa'