json.extract! client, :id, :fullname, :cpf, :cnpj, :street, :house_number, :city, :cep, :created_at, :updated_at
json.url client_url(client, format: :json)
