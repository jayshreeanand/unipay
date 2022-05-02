class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :user
      t.belongs_to :contact
      t.bigint :from_value
      t.string :from_currency
      t.bigint :to_value
      t.string :to_currency

      t.timestamps
    end
  end
end
