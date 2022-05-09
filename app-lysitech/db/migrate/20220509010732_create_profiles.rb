class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :fullname
      t.string :register
      t.string :department
      t.string :email
      t.references :profile_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
