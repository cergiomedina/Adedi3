json.array!(@arriendo_estados) do |arriendo_estado|
  json.extract! arriendo_estado, :id
  json.url arriendo_estado_url(arriendo_estado, format: :json)
end
