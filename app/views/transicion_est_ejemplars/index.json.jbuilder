json.array!(@transicion_est_ejemplars) do |transicion_est_ejemplar|
  json.extract! transicion_est_ejemplar, :id
  json.url transicion_est_ejemplar_url(transicion_est_ejemplar, format: :json)
end
