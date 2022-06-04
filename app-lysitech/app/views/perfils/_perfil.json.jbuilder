json.extract! perfil, :id, :nome, :dt_nascimento, :cpf, :cargo, :departamento, :email, :rua, :numero, :bairro, :cep, :cidade, :uf, :tipo_perfil_id, :created_at, :updated_at
json.url perfil_url(perfil, format: :json)
