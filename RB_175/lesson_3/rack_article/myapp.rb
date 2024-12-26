# require 'bundler/setup'
# require 'rack'
# require 'webrick'

class MyApp
  def call(env)
    #body = "<h2>Hello in Style!</h2>"
    [200, { "content-type" => "text/html" }, ["hello world"]]
  end
end

class FriendlyGreeting
  def initialize(app)
    @app = app
  end

  def call(env)
    body = @app.call(env).last
    [
      200, 
      { "content-type" => "text/plain" }, 
      body.prepend("A warm welcome to you!\n")
    ]
  end
end

class Wave
  def initialize(app)
    @app = app
  end
  def call(env)
    body = @app.call(env).last
   
    [
     200, 
     { "content-type" => "text/plain" }, 
     body.prepend("Wave from afar!\n")
    ]
  end 
end