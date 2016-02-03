json.array!(@transicion_arriendos) do |transicion_arriendo|
  json.extract! transicion_arriendo, :id
  json.url transicion_arriendo_url(transicion_arriendo, format: :json)
end
