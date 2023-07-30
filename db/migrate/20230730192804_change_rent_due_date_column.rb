class ChangeRentDueDateColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :properties, :rent_due_date, :integer
  end
end
