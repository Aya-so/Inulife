class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :introduction
      t.string :place
      t.string :image_id
      t.integer :event_status, default: 0
      t.date :start
      t.date :finish
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
