class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |f|
      f.string :username
      f.string :password

    end
  end
end
