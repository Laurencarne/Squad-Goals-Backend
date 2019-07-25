class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :name
      t.float :total
      t.string :desc
      t.integer :flatmate_id

      t.timestamps
    end
  end
end
