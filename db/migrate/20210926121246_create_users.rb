class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.datetime :birthday
      t.string :city
      t.string :password_digest

      t.timestamps
    end
  end
end
