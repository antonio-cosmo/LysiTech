class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :senha
      t.references :perfil, null: false, foreign_key: true

      t.timestamps
    end
  end
end
