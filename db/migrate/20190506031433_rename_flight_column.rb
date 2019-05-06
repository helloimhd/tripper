class RenameFlightColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :flights, :type, :flight_type
  end
end