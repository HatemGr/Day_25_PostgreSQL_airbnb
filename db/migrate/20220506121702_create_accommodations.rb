class CreateAccommodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accommodations do |t|
      t.integer :available_beds
      t.integer :price
      t.integer :description
      t.boolean :has_wifi
      t.text :welcome_message

      t.belongs_to :city, index: true
      t.belongs_to :admin, index: true

      t.timestamps
    end
  end
end
