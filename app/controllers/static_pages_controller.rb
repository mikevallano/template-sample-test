class StaticPagesController < ApplicationController
  def index
    movie_title = params[:movie_title].gsub(" ","-")
    content = open("http://www.omdbapi.com/?t=#{movie_title}&y=&plot=short&r=json").read
    @results = JSON.parse(content, symbolize_names: true)
  end
end
