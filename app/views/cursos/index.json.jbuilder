json.array!(@cursos) do |curso|
  json.extract! curso, :id, :nome, :descricao, :professor_id
  json.url curso_url(curso, format: :json)
end
