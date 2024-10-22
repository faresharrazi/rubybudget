class Income < ActiveRecord::Base
  attr_accessor :id, :name, :amount, :type

  @@next_id = 1  # Class variable to auto-increment IDs
  @@valid_types = ['Salary', 'Rent', 'Other']  # Default income types

  def initialize(name, amount, type)
    @id = @@next_id
    @@next_id += 1
    @name = name
    @amount = amount
    if @@valid_types.include?(type)
      @type = type
    else
      raise "Invalid income type. Valid types are: #{@@valid_types.join(', ')}"
    end
  end

  # Class method to add new types of income
  def self.add_type(new_type)
    @@valid_types << new_type unless @@valid_types.include?(new_type)
  end

  # Class method to list all valid types
  def self.types
    @@valid_types
  end
end
