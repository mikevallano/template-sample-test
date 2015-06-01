class StaticPagesController < ApplicationController

  # def index
  #   @results = []
  #   @listomovies = ["pulp fiction", "interstellar", "birdman", "the imitation game"]
  #   @listomovies.each do |i|
  #     movie_title = i.gsub(" ","-")
  #     # movie_title = params[:movie_title].gsub(" ","-")
  #     content = open("http://www.omdbapi.com/?t=#{movie_title}&y=&plot=short&r=json").read
  #     @results << JSON.parse(content, symbolize_names: true)
  #   end
  # end

  def index
    movie_title = params[:movie_title].gsub(" ","-")
    content = open("http://www.omdbapi.com/?t=#{movie_title}&y=&plot=short&r=json").read
    @results = JSON.parse(content, symbolize_names: true)
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


end
