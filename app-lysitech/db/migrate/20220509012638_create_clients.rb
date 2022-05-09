class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :fullname
      t.string :cpf
      t.string :cnpj
      t.string :street
      t.string :house_number
      t.string :city
      t.string :cep

      t.timestamps
    end
  end
end
