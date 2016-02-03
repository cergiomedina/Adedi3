json.array!(@ejemplar_estados) do |ejemplar_estado|
  json.extract! ejemplar_estado, :id
  json.url ejemplar_estado_url(ejemplar_estado, format: :json)
end
