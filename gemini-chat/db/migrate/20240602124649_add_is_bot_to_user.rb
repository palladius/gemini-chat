class AddIsBotToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_bot, :boolean, default: false
  end
end
