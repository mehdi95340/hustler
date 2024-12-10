# Delete all existing data
Expense.destroy_all
Category.destroy_all
Budget.destroy_all
User.destroy_all

# Create users
users = [
  { email: "grantbeven@gmail.com", password: "password1"},
  { email: "dmitrygoremykinzw@gmail.com", password: "password2"},
  { email: "massiyad@gmail.com", password: "password3"},
]
 users.each do |user_attributes|
  User.create!(user_attributes)
 end

 # Create budgets
 budgets = [
  { user_id: User.first.id, month: 2 , total_amount: 3000},
  { user_id: User.second.id, month: 6 , total_amount: 1000},
  { user_id: User.third.id, month: 7, total_amount: 500},
 ]

 budgets.each do |budget_attributes|
  Budget.create!(budget_attributes)
 end

 # Create categories
 categories = [
   { name: "Entertainment", user_id: User.all.sample.id },
   { name: "Restaurant", user_id: User.all.sample.id  },
   { name: "Groceries", user_id: User.all.sample.id },
   { name: "Transport", user_id: User.all.sample.id },
   { name: "Personal Care", user_id: User.all.sample.id },
   { name: "Subscriptions Digital...", user_id: User.all.sample.id },
   { name: "Spaceships Cars...", user_id: User.all.sample.id },
   { name: "Ice Jewels...", user_id: User.all.sample.id },
   { name: "Drip Clothes...", user_id: User.all.sample.id },
  ]

  categories.each do |categories_attributes|
    Category.create!(categories_attributes)
  end

  # Create expenses
  
 expenses = [
  { budget_id: Budget.first.id, category_id: Category.first.id, amount: 1500, description: "Weekly groceries" },
  { budget_id: Budget.second.id, category_id: Category.second.id, amount: 50, description: "Ice cream"},

 ]

 expenses.each do |expense_attributes|
  Expense.create!(expense_attributes)
 end

  puts "Seeds was created succesfully!"

#  category_name = "Fitness & Health" # new category name
#  user_id = User.all.sample.id   #assign random user

#  category = Category.find_or_create_by!(name: category_name, user_id: user_id) #check category exist if not create it

#  #create new expense
#  Expense.create!(
#   budget_id: Budget.first.id,

#   category_id: category.id,
#   amount: 100,
#   description: "Gym subscription"
#  )

#  puts "New category and expense created: #{category_name}"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
