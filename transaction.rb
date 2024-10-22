class Transaction < ActiveRecord::Base
  belongs_to :account
  attr_accessor :id, :name, :amount, :type, :account, :date

  @@next_id = 1  # Class variable to auto-increment IDs
  @@valid_types = ['Groceries', 'Bills', 'Jasmine', 'Gas', 'Other']  # Default transaction types

  def initialize(name, amount, type, account, date)
    @id = @@next_id
    @@next_id += 1
    @name = name
    @amount = amount
    @account = account
    @date = date
    if @@valid_types.include?(type)
      @type = type
    else
      raise "Invalid transaction type. Valid types are: #{@@valid_types.join(', ')}"
    end
    account.add_transaction(self)  # Automatically add the transaction to the account
  end

  # Class method to add new types of transactions
  def self.add_type(new_type)
    @@valid_types << new_type unless @@valid_types.include?(new_type)
  end

  # Class method to list all valid types
  def self.types
    @@valid_types
  end
end
