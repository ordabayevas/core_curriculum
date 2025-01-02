# Add gem paths to $LOAD_PATH manually
# $LOAD_PATH.unshift("/Users/ordabayeva/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.2/gems/tilt-2.5.0/lib")
# $LOAD_PATH.unshift("/Users/ordabayeva/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.2/gems/erubis-2.7.0/lib")

require "erubis"
# require "tilt"
require "sinatra"
require "sinatra/reloader"

set :server, 'webrick'  # Force Sinatra to use WEBrick

before do
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  
  redirect "/" unless (1..@contents.size).cover? number
  
  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

def each_chapter
  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

def chapters_matching(query)
  results = []

  return results unless query

  each_chapter do |number, name, contents|
    matches = {}
    contents.split("\n\n").each_with_index do |paragraph, index|
      matches[index] = paragraph if paragraph.include?(query)
    end
    results << {number: number, name: name, paragraphs: matches} if matches.any?
  end

  results
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

helpers do
  def in_paragraphs(chapter)
    chapter.split("\n\n").map.with_index do |paragraph, index|
      "<p'>#{paragraph}<\p>"
    end.join
  end

  def highlight(text, term)
    text.gsub(term, %(<strong>#{term}</strong>))
  end
end

not_found do
  redirect "/"
end