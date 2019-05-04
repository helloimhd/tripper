class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :details
      t.float :amount
      t.boolean :spent
      t.references :trip

      t.timestamps
    end
  end
end