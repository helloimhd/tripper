class DeleteColInTodo < ActiveRecord::Migration[5.2]
  def change
    remove_column :to_dos, :category_id
    remove_column :to_dos, :date
  end
end