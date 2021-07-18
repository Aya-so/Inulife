class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.references :review_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
