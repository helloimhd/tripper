class ChangeFlightsColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :flights, :flight_no, :string
  end
end