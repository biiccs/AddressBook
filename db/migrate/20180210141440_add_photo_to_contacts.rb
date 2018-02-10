class AddPhotoToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :photo, :string
  end
end
