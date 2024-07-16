class AddDefaultRoleToRoles < ActiveRecord::Migration[7.1]
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
end
