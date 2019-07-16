class CreateFlatmates < ActiveRecord::Migration[5.2]
  def change
    create_table :flatmates do |t|
      t.integer :flat_id
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birthday
      t.date :move_in
      t.integer :rent_due
      t.integer :water_due
      t.integer :electricity_due
      t.integer :gas_due
      t.string :avatar
      t.string :password_digest

      t.timestamps
    end
  end
end
