json.array!(@arriendos) do |arriendo|
  json.extract! arriendo, :id
  json.url arriendo_url(arriendo, format: :json)
end
