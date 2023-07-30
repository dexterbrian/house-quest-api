class AddCityToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :city, :string
  end
end
