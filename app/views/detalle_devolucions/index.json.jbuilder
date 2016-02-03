json.array!(@detalle_devolucions) do |detalle_devolucion|
  json.extract! detalle_devolucion, :id
  json.url detalle_devolucion_url(detalle_devolucion, format: :json)
end
