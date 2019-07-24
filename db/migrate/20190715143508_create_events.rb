class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.boolean :allDay
      t.datetime :start
      t.datetime :end
      t.string :desc
      t.integer :flatmate_id

      t.timestamps
    end
  end
end
