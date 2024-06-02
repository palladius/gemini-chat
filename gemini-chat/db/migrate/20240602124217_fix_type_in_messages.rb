class FixTypeInMessages < ActiveRecord::Migration[7.1]
  def change
    rename_column :messages, :type, :msg_type
  end
end
