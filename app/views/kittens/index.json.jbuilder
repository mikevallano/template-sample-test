json.array!(@kittens) do |kitten|
  json.extract! kitten, :id, :name, :age, :softness, :cuteness
  json.url kitten_url(kitten, format: :json)
end
