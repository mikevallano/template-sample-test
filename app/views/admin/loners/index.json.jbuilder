json.array!(@loners) do |loner|
  json.extract! loner, :id
  json.url loner_url(loner, format: :json)
end
