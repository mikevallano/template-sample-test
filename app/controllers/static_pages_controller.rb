class StaticPagesController < ApplicationController

def index
  if params[:movie_title]
    @movie_title = params[:movie_title].gsub(" ","-")
  else
    @movie_title = "fargo"
  end

  @content = open("http://www.omdbapi.com/?t=#{@movie_title}&y=&plot=short&r=json").read
  @results = JSON.parse(@content, symbolize_names: true)
end

def results
  @kitty = params[:kitty]
  movie_title = params[:movie_title].gsub(" ","-")
  content = open("http://www.omdbapi.com/?t=#{movie_title}&y=&plot=short&r=json").read
  @results = JSON.parse(content, symbolize_names: true)
end

def furry
  @kittens = Kitten.all
end

def flick
  key = ENV["FLICKR_KEY"]
  if params[:tag]
    @tag = params[:tag].gsub(" ","-")

  else
    @tag = "kitteh"
  end

  url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{key}&tags=#{@tag}&format=json&nojsoncallback=1"

  @content = JSON.load(open(url))

  @photoarray = []
  @content["photos"]["photo"].each do |i|
    farm_id = i["farm"]
    server_id = i["server"]
    id = i["id"]
    secret = i["secret"]
    photourl = "http://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"
    @photoarray << photourl
  end

end



end
