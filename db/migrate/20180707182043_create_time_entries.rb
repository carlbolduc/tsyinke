class CreateTimeEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :time_entries do |t|
      t.float :hours
      t.text :note
      t.references :user, foreign_key: true
      t.references :time_period, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
