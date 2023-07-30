class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.integer :owner_id
      t.string :type
      t.integer :rent
      t.datetime :rent_due_date
      t.string :location
      t.string :building
      t.integer :floor
      t.string :coordinates
      t.string :other_info
      t.timestamps
    end
  end
end
