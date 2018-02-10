class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :phone
      t.string :email
      t.string :image

      t.timestamps
    end
  end
end
