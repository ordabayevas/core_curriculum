# Add gem paths to $LOAD_PATH manually
# $LOAD_PATH.unshift("/Users/ordabayeva/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.2/gems/tilt-2.5.0/lib")
# $LOAD_PATH.unshift("/Users/ordabayeva/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.2/gems/erubis-2.7.0/lib")

require "erubis"
# require "tilt"
require "sinatra"
require "sinatra/reloader"

set :server, 'webrick'  # Force Sinatra to use WEBrick

get "/" do
  # File.read "public/template.html"

  @title = "The Adventures of Sherlock Holmes"
  @toc = File.readlines "data/toc.txt"
  
  erb :home

end