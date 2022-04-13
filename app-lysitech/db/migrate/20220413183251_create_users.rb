class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.references :profile, foreign_key: true, null: false

      t.timestamps
    end
  end
end
