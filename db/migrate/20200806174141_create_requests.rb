class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.belongs_to :sender
      t.belongs_to :recipient
      t.string :amount
      t.timestamps
    end
  end
end
