json.array!(@ejemplars) do |ejemplar|
  json.extract! ejemplar, :id
  json.url ejemplar_url(ejemplar, format: :json)
end
