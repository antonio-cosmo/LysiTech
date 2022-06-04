json.extract! ordem_servico, :id, :titulo, :categoria, :descricao, :solucao, :estatus, :dt_abertura, :dt_encerramento, :perfil_id, :cliente_id, :created_at, :updated_at
json.url ordem_servico_url(ordem_servico, format: :json)
