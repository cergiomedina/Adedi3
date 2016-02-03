json.array!(@log_auditoria) do |log_auditorium|
  json.extract! log_auditorium, :id
  json.url log_auditorium_url(log_auditorium, format: :json)
end
