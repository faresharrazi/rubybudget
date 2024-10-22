require 'sinatra'
require 'json'
require 'sinatra/cors'
require 'sinatra/activerecord'
require_relative 'income'
require_relative 'outcome'
require_relative 'account'
require_relative 'budget_manager'

# Set up SQLite database for development
set :database, { adapter: "sqlite3", database: "db/budget_app.db" }

# Enable CORS
set :allow_origin, "http://localhost:8080"
set :allow_methods, "GET,POST,OPTIONS"
set :allow_headers, "content-type,if-modified-since"

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

options "*" do
  response.headers["Allow"] = "GET, POST, OPTIONS"
  response.headers["Access-Control-Allow-Origin"] = "http://localhost:8080"
  response.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Content-Type"
  200
end

