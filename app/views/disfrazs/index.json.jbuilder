json.array!(@disfrazs) do |disfraz|
  json.extract! disfraz, :id
  json.url disfraz_url(disfraz, format: :json)
end
