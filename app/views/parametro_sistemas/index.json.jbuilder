json.array!(@parametro_sistemas) do |parametro_sistema|
  json.extract! parametro_sistema, :id
  json.url parametro_sistema_url(parametro_sistema, format: :json)
end
