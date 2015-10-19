class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :city
      t.text :address
      t.date :date
      t.time :time
      t.integer :price
      t.integer :prize

      t.timestamps null: false
    end
  end
end
