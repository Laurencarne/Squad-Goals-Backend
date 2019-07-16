class CreateCalenders < ActiveRecord::Migration[5.2]
  def change
    create_table :calenders do |t|
      t.integer :flat_id

      t.timestamps
    end
  end
end
