class CreateTelefonePerfils < ActiveRecord::Migration[7.0]
  def change
    create_table :telefone_perfils do |t|
      t.string :numero_tel
      t.references :perfil, null: false, foreign_key: true

      t.timestamps
    end
  end
end
