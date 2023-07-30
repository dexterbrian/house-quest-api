class ChangeTypeToHouseType < ActiveRecord::Migration[6.1]
  def change
    remove_column :properties, :type, :string
    add_column :properties, :house_type, :string
  end
end
