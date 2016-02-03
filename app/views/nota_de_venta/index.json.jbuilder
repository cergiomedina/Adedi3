json.array!(@nota_de_venta) do |nota_de_ventum|
  json.extract! nota_de_ventum, :id
  json.url nota_de_ventum_url(nota_de_ventum, format: :json)
end
