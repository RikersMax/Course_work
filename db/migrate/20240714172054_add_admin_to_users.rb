class AddAdminToUsers < ActiveRecord::Migration[7.1]
  User.create({
    fio: 'test',
    login: 'admin',
    password: 'admin',
    role_id: 5
  })
end
