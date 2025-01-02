# When a user visits the root path, /, they should be presented with a listing of all of the files in the public directory. The listing for a file should only display the file's name -- don't display the name of the directory that contains those files. For example, if public contains a file named whodat.doc, then the app should only display whodat.doc; it should not display any path information such as public/whodat.doc or /Users/xyzzy/project/public/whodat.doc.
# When a user clicks one of the filenames in the list, they should be taken directly to that file. Take advantage of Sinatra's built-in serving of the public directory.
# Create at least 5 files in the public directory to test the listing page.
# Add a parameter that controls the sort order of the files on the page. They should be sorted in an ascending (A-Z) order by default, or descending (Z-A) if the parameter has a certain value.
# Display a link to reverse the order. The text of the link should reflect the order that will be displayed if it is clicked: "Sort ascending" or "Sort descending".

require "sinatra"
require "sinatra/reloader"

set :server, 'webrick'

get "/" do
  @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort
  @files.reverse! if params[:sort] == "desc"

  erb :public_list
end
