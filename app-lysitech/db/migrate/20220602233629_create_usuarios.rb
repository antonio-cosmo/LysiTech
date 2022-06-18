class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :senha
      t.boolean :ativo
      t.boolean :gestor
      
      t.timestamps
    end
  end
end


