class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.boolean :is_private, :default => false
      t.boolean :is_active, :default => true
      t.boolean :has_bot, :default => true

      t.timestamps
    end
  end
end
