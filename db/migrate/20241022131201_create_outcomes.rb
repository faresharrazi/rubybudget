class CreateOutcomes < ActiveRecord::Migration[6.0]
  def change
    create_table :outcomes do |t|
      t.string :name
      t.decimal :amount
      t.string :outcome_type # Again, avoid using reserved `type`.
      t.timestamps
    end
  end
end

