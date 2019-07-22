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
      t.date :rent_due
      t.date :water_due
      t.date :electricity_due
      t.date :gas_due
      t.string :avatar
      t.string :password_digest

      t.timestamps
    end
  end
end
