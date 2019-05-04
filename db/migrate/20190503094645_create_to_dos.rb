class CreateToDos < ActiveRecord::Migration[5.2]
  def change
    create_table :to_dos do |t|
      t.string :details
      t.date :date
      t.references :category
      t.references :trip

      t.timestamps
    end
  end
end