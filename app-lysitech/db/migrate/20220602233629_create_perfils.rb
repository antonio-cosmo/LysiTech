class CreatePerfils < ActiveRecord::Migration[7.0]
  def change
    create_table :perfils do |t|
      t.string :nome
      t.date :dt_nascimento
      t.string :cpf
      t.string :cargo
      t.string :departamento
      t.string :email
      t.string :rua
      t.string :numero
      t.string :bairro
      t.string :cep
      t.string :cidade
      t.string :uf
      t.references :tipo_perfil, null: false, foreign_key: true

      t.timestamps
    end
  end
end
