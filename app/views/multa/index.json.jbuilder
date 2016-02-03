json.array!(@multa) do |multum|
  json.extract! multum, :id
  json.url multum_url(multum, format: :json)
end
