json.array!(@professores) do |professor|
  json.extract! professor, :id, :nome, :formacao
  json.url professor_url(professor, format: :json)
end
