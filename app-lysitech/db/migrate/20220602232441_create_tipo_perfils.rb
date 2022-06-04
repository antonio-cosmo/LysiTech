class CreateTipoPerfils < ActiveRecord::Migration[7.0]
  def change
    create_table :tipo_perfils do |t|
      t.string :tipo, null: false

      t.timestamps
    end
  end
end
