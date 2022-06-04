class CreateTelefoneClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :telefone_clientes do |t|
      t.string :numero_tel
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
