class CreateCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :calls do |t|
      t.string :title
      t.string :category
      t.text :call_description
      t.text :solution
      t.date :begin_date
      t.date :end_date
      t.string :status
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
