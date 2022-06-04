json.extract! usuario, :id, :usuario, :senha, :perfil_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
