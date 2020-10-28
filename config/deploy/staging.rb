if "itself" == ENV["DEPLOY_TYPE"]
  # https://github.com/capistrano/rails#recommendations
  # No using db roles because Rails migrations are strictly related to the framework.
  server "localhost", user: "deploy", roles: %i[web_app]
elsif "remote" == ENV["DEPLOY_TYPE"]
  # TODO Deploy multi install
  raise "Please implement !!!"
else
  raise "Please set $DEPLOY_TYPE !!!"
end
