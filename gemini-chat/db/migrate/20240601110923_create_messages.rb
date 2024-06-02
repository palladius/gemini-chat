class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.string :type # doesnt work well, its used for multiple inheritance - OOPS
      t.text :content
      t.text :internal_stuff

      t.timestamps
    end
  end
end
