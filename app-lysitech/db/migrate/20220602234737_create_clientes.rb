class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :cnpj
      t.string :inscr_estadual
      t.string :razao_social
      t.string :nome_fantasia
      t.string :telefone
      t.string :email
      t.string :rua
      t.string :numero
      t.string :bairro
      t.string :cep
      t.string :cidade
      t.string :uf
      t.boolean :ativo
      t.text :observacao

      t.timestamps
    end
  end
end

