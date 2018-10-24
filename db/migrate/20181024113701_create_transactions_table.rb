class CreateTransactionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.jsonb :banknotes, default: {}
      t.integer :total_amount
      t.boolean :success, default: false

      t.timestamp
    end
  end
end
