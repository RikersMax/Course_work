# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
=begin
Role.create([{
  name: 'Viewer',
  number: 1,
  description: 'Может просматривать элементы не требующие авторизации'
  },
  {
  name: 'Field Worker',
  number: 2,
  description: 'Может просматривать и редактировать данные'
  },
  {
  name: 'Creator',
  number: 3,
  description: 'Может создавать, просматривать и редактировать данные'
  },
  {
  name: 'Master',
  number: 4,
  description: 'Может создавать, просматривать и редактировать данные, может добавлять и удалять новых пользователей'
  },
  {
  name: 'Admin',
  number: 5,
  description: 'Обладает все правами Master, необходим для редактрования и отладки приложения'
  }
])
=end
