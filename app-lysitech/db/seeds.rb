# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


profile_type = [
  {
    description: 'manager',
  },
  {
    description: 'support'
  }
]

ProfileType.create(profile_type)

profile = {
  fullname: 'admin',
  register: '0',
  department: 'admin',
  emial: nil,
  profile_type: ProfileType.all.first
}

Profile.create(profile)

user = {
  username: 'admin',
  userpassword: 'admin',
  profile: Profile.all.first
}

User.create(user)
