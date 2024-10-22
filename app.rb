require 'sinatra'
require 'json'
require_relative 'income'
require_relative 'outcome'
require_relative 'account'
require_relative 'budget_manager'

# Initialize the budget manager
manager = BudgetManager.new

# Route to add income
post '/income' do
  data = JSON.parse(request.body.read)
  income = Income.new(data["name"], data["amount"], data["type"])
  manager.add_income(income)
  content_type :json
  { status: "Income added successfully" }.to_json
end

# Route to add outcome
post '/outcome' do
  data = JSON.parse(request.body.read)
  outcome = Outcome.new(data["name"], data["amount"], data["type"])
  manager.add_outcome(outcome)
  content_type :json
  { status: "Outcome added successfully" }.to_json
end

# Route to get accounts
get '/accounts' do
  accounts_data = manager.accounts.map do |account|
    {
      name: account.name,
      amount: account.amount,
      fraction: account.fraction
    }
  end
  content_type :json
  accounts_data.to_json
end

# Route to distribute income
post '/distribute_income' do
  manager.distribute_income
  content_type :json
  { status: "Income distributed successfully" }.to_json
end