require 'rack-proxy'

class AppProxy < Rack::Proxy
  def rewrite_env(env)
    request = Rack::Request.new(env)
    if request.path =~ %r{^/api}
      env["HTTP_HOST"] = "localhost:3001"
    else
      env["HTTP_HOST"] = "localhost:3000"
    end
    env
  end
end

run AppProxy.new
