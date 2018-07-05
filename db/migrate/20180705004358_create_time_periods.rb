class CreateTimePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :time_periods do |t|
      t.date :start
      t.integer :duration
      t.boolean :locked

      t.timestamps
    end
  end
end
