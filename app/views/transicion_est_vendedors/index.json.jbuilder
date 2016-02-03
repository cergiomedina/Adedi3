json.array!(@transicion_est_vendedors) do |transicion_est_vendedor|
  json.extract! transicion_est_vendedor, :id
  json.url transicion_est_vendedor_url(transicion_est_vendedor, format: :json)
end
