json.array!(@disfrazs) do |disfraz|
  json.extract! disfraz, :id, :ID_DISFRAZ, :ID_CATEGORIA, :NOMBRE_DISFRAZ, :CATEGORIA_DISFRAZ, :STOCK_DISFRAZ, :STOCK_DISPONIBLE
  json.url disfraz_url(disfraz, format: :json)
end
