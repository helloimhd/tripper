class AddColumnTodo < ActiveRecord::Migration[5.2]
  def change
  	add_column :to_dos, :done, :boolean
  end
end
