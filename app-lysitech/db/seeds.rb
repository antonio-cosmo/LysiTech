# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# profile_type = [
#   {
#     description: 'manager',
#   },
#   {
#     description: 'support'
#   }
# ]



# profile_type.each do |type|
#   ProfileType.find_or_create_by(type) 
# end


# profile = {
#   fullname: 'admin',
#   register: '0',
#   department: 'admin',
#   email: nil,
#   profile_type: ProfileType.all.first
# }

# Profile.find_or_create_by(profile)


# user = {
#   username: 'admin',
#   userpassword: 'admin',
#   profile: Profile.all.first
# }



# User.find_or_create_by(user)


tipo_perfil = [
  {
    tipo: 'gerente',
  },
  {
    tipo: 'suporte'
  }
]

tipo_perfil.each do |tipo|
  TipoPerfil.find_or_create_by(tipo) 
end

perfil = {
  nome:'gerente',
  tipo_perfil: TipoPerfil.all.first
}

Perfil.find_or_create_by(perfil)

usuario = {
  usuario: 'admin',
  senha: '12345',
  perfil: Perfil.all.first
}

Usuario.find_or_create_by(usuario)
