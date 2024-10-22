class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :name
      t.decimal :amount
      t.string :income_type # Renaming `type` to `income_type` because `type` is a reserved keyword in ActiveRecord.
      t.timestamps
    end
  end
end
