json.array!(@cliente_estados) do |cliente_estado|
  json.extract! cliente_estado, :id
  json.url cliente_estado_url(cliente_estado, format: :json)
end
