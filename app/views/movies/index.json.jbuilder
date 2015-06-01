json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :imdb_rating, :runtime, :genre, :plot
  json.url movie_url(movie, format: :json)
end
