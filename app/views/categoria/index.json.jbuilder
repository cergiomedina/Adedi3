json.array!(@categoria) do |categorium|
  json.extract! categorium, :id, :NOMBRE_CATEGORIA, :STOCK_CATEGORIA, :ID_CATEGORIA
  json.url categorium_url(categorium, format: :json)
end
