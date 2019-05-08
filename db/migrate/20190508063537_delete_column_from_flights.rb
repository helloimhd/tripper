class DeleteColumnFromFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :flight_type
  end
end