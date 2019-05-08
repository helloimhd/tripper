class AddColumnToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :budget, :float
  end
end