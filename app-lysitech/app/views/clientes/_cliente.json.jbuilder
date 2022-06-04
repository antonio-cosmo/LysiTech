json.extract! cliente, :id, :cnpj, :inscr_estadual, :razao_social, :nome_fantasia, :email, :rua, :numero, :bairro, :cep, :cidade, :uf, :observacao, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
