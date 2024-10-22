class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.decimal :amount
      t.string :account_type
      t.decimal :fraction
      t.timestamps
    end
  end
end

