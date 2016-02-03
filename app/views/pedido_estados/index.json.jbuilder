json.array!(@pedido_estados) do |pedido_estado|
  json.extract! pedido_estado, :id
  json.url pedido_estado_url(pedido_estado, format: :json)
end
