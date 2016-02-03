json.array!(@detalle_arriendos) do |detalle_arriendo|
  json.extract! detalle_arriendo, :id
  json.url detalle_arriendo_url(detalle_arriendo, format: :json)
end
