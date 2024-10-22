# budget_manager.rb

class BudgetManager
  attr_accessor :incomes, :outcomes, :accounts

  def initialize
    @incomes = []
    @outcomes = []
    @accounts = []
  end

  # Add income to the system
  def add_income(income)
    @incomes << income
  end

  # Add outcome to the system
  def add_outcome(outcome)
    @outcomes << outcome
  end

  # Add account to the system
  def add_account(account)
    @accounts << account
  end

  # Calculate net income after deducting outcomes
  def calculate_net_income
    total_income = @incomes.sum(&:amount)
    total_outcome = @outcomes.sum(&:amount)
    net_income = total_income - total_outcome
    net_income
  end

  # Distribute the net income across accounts based on their fractions
  def distribute_income
    net_income = calculate_net_income
    @accounts.each do |account|
      account_amount = net_income * account.fraction
      account.amount += account_amount  # Add to the current balance (compounding)
    end
  end
end
