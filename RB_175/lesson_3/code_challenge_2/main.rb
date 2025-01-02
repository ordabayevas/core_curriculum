require "erubis"
require "sinatra"
require "sinatra/reloader"
require "YAML"

before do
  @file = YAML.load_file("user.yaml") # {:jamy=>{}, :nora=>{}, :hiroko=>{}}
  @users = @file.keys
  @total_int = count_interests
end

get "/" do
  @title = "Names"
  erb :names
end

get "/:name" do
  name = params[:name]

  @title = name.to_s.capitalize
  @email = @file[name.to_sym][:email]
  @interests = @file[name.to_sym][:interests]

  erb :user
end

helpers do 
  def count_interests
    total_int = 0
    @file.each do |name, email_int|
      total_int += email_int[:interests].size
    end
    total_int
  end
end