class CreateUserTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_types do |t|
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
