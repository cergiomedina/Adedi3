json.array!(@transicion_est_clientes) do |transicion_est_cliente|
  json.extract! transicion_est_cliente, :id
  json.url transicion_est_cliente_url(transicion_est_cliente, format: :json)
end
