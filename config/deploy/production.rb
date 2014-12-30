# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

# role :app, %w{deploy@example.com}
# role :web, %w{deploy@example.com}
# role :db,  %w{deploy@example.com}

# set :stage, :production

# set :branch, "master"

# set :server_name, "54.69.30.251"

# set :deploy_to, '/var/www/todoApp'

# set :rails_env, :production

#role :all, %w{deploy@54.69.30.251}

#set :ssh_options, user: 'ubuntu', forward_agent: true

#set :ssh_options, { :forward_agent => true, :port => 1754, :keys => %w(/Users/ved/.ssh/id_rsa1.pub) }


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

#server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

# server '54.69.30.251', user: 'ubuntu', roles: %w{web app db}, primary: true
server '54.148.131.143', user: 'ubuntu', roles: %w{web app db}, primary: true

#set :ssh_options, user: 'ubuntu', forward_agent: true
#set :branch, "master"


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
	
	# set :ssh_options, {  
 #    	verbose: :debug
	# }

#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
