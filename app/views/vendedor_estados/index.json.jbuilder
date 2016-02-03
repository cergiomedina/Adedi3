json.array!(@vendedor_estados) do |vendedor_estado|
  json.extract! vendedor_estado, :id
  json.url vendedor_estado_url(vendedor_estado, format: :json)
end
