class AddDestinationsToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :from, :string
    add_column :flights, :to, :string
  end
end