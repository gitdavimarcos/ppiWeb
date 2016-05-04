json.array!(@turmas) do |turma|
  json.extract! turma, :id, :inscricao_id, :curso_id, :professor_id, :turma, :sala, :data_ini, :data_ter, :turno
  json.url turma_url(turma, format: :json)
end
