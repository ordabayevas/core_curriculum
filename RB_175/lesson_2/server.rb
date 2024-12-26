require "socket"

def parse_request(request_line)
  http_scheme, path_and_params, http_method = request_line.split(" ")
  path, params = path_and_params.split("?")
  params = params.split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end

  [http_scheme, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.1 200/OK\r\nContent-type:text/html\r\n\r\n"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  # client.puts request_line
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Rolls!</h1>"

  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  # points = 0
  # rolls.times do
  #   roll = rand(sides) + 1
  #   points += roll
  # end
  # client.puts points

  rolls.times do
    roll = rand(sides) + 1
    client.puts "<p>", roll, "</p>"
  end

  client.puts "</body>"
  client.puts "</html>"

  client.puts 
  client.close
end

