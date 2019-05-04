class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :airline_code
      t.integer :flight_no
      t.date :dept_date
      t.time :dept_time
      t.date :arr_date
      t.time :arr_time
      t.string :type
      t.references :trip

      t.timestamps
    end
  end
end