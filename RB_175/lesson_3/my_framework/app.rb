require_relative 'advice'     # loads advice.rb
require_relative 'monroe'

class App < Monroe
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      status = '200'
      headers = {"Content-Type" => "text/html"}
      response(status, headers) do 
        erb(:index)
      end
    when '/advice'
      status = '200'
      headers = {"Content-Type" => "text/html"}
      piece_of_advice = Advice.new.generate    # random piece of advice
      response(status, headers) do
        erb(:advice, message: piece_of_advice)
      end
    else
      status = '404'
      response_body = erb(:not_found)
      headers = {"Content-Type" => "text/html", "Content-Length" => response_body.bytesize.to_s}
      response(status, headers) do
        erb(:not_found)
      end
    end
  end
end