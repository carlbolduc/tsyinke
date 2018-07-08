class AddDayToTimeEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :time_entries, :day, :date
  end
end
