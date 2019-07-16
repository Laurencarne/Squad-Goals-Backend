class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :flat_key
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :postcode

      t.timestamps
    end
  end
end
