class CreateBanknotesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :banknotes do |t|
      t.integer :nominal_value, index: { unique: true }
      t.integer :amount, default: 0
    end
  end
end
