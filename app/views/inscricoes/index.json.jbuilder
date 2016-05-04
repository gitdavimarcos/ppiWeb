json.array!(@inscricoes) do |inscricao|
  json.extract! inscricao, :id, :nome, :endereco, :telefone, :cidade, :curso_id
  json.url inscricao_url(inscricao, format: :json)
end
