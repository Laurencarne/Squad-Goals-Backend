class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :shopping_list_id
      t.string :name

      t.timestamps
    end
  end
end
