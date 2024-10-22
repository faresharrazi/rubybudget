class Account < ActiveRecord::Base
  has_many :transactions
  attr_accessor :id, :name, :amount, :type, :transactions, :fraction

  @@next_id = 1  # Class variable to auto-increment IDs
  @@valid_types = ['Daily', 'Savings', 'Investments', 'Other']  # Default account types

  def initialize(name, amount, type, fraction)
    @id = @@next_id
    @@next_id += 1
    @name = name
    @amount = amount
    @transactions = []
    if @@valid_types.include?(type)
      @type = type
    else
      raise "Invalid account type. Valid types are: #{@@valid_types.join(', ')}"
    end
    @fraction = fraction
  end

  # Class method to add new types of accounts
  def self.add_type(new_type)
    @@valid_types << new_type unless @@valid_types.include?(new_type)
  end

  # Class method to list all valid types
  def self.types
    @@valid_types
  end

  # Method to add transactions to the account
  def add_transaction(transaction)
    @transactions << transaction
    @amount -= transaction.amount  # Deduct the transaction amount from the account
  end

  # Method to update the fraction for the account
  def update_fraction(new_fraction)
    @fraction = new_fraction
  end
end
