json.array!(@transicion_est_pedidos) do |transicion_est_pedido|
  json.extract! transicion_est_pedido, :id
  json.url transicion_est_pedido_url(transicion_est_pedido, format: :json)
end
