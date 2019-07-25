class CreateBillSplits < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_splits do |t|
      t.integer :flatmate_id
      t.integer :bill_id
      t.float :total_owed
      t.boolean :paid

      t.timestamps
    end
  end
end
