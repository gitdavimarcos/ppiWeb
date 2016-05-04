json.array!(@notas) do |nota|
  json.extract! nota, :id, :inscricao_id, :curso_id, :nota, :frequencia
  json.url nota_url(nota, format: :json)
end
