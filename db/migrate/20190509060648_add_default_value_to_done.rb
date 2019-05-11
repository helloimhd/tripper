class AddDefaultValueToDone < ActiveRecord::Migration[5.2]
  def change
  	change_column :to_dos, :done, :boolean, default: false
  end
end
