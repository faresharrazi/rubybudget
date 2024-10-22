class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.decimal :amount
      t.string :transaction_type
      t.references :account, foreign_key: true # Reference to accounts
      t.date :date
      t.timestamps
    end
  end
end
