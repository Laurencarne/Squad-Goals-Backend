class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :flat_id
      t.string :name
      t.string :avatar
      t.string :description

      t.timestamps
    end
  end
end
