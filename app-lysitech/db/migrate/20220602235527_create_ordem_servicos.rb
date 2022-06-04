class CreateOrdemServicos < ActiveRecord::Migration[7.0]
  def change
    create_table :ordem_servicos do |t|
      t.string :titulo
      t.string :categoria
      t.text :descricao
      t.text :solucao
      t.integer :estatus
      t.date :dt_abertura
      t.date :dt_encerramento
      t.references :perfil, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
