class AddLayoutToUsers < ActiveRecord::Migration[5.1]
  def self.up
    add_column :users, :layout, :integer, default: 0
  end
end
