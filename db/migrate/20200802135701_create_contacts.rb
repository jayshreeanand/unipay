class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :user
      t.string :name
      t.text :description
      t.string :payid
      t.integer :type
      t.string :avatar

      t.timestamps
    end
  end
end
