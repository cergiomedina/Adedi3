json.array!(@pedidos_detalles) do |pedidos_detalle|
  json.extract! pedidos_detalle, :id
  json.url pedidos_detalle_url(pedidos_detalle, format: :json)
end
