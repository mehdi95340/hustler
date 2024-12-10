# Delete all existing data
Expense.destroy_all
Category.destroy_all
Budget.destroy_all
User.destroy_all

# Create users
users = [
  { email: "test@test.com", password: "123456"},

]
 users.each do |user_attributes|
  User.create!(user_attributes)
 end

 # Create budgets
 budgets = [
   { user_id: User.first.id, month: 1 , total_amount: 3000},
   { user_id: User.first.id, month: 2 , total_amount: 3050},
   { user_id: User.first.id, month: 3 , total_amount: 4658},
   { user_id: User.first.id, month: 4 , total_amount: 3200},
   { user_id: User.first.id, month: 5 , total_amount: 3000},
   { user_id: User.first.id, month: 6 , total_amount: 2165},
   { user_id: User.first.id, month: 7 , total_amount: 6879},
   { user_id: User.first.id, month: 8 , total_amount: 3320},
   { user_id: User.first.id, month: 9 , total_amount: 6523},
   { user_id: User.first.id, month: 10 , total_amount: 7986},
   { user_id: User.first.id, month: 11, total_amount: 4122},
   { user_id: User.first.id, month: 12, total_amount: 1023},

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
  { budget_id: Budget.first.id, category_id: Category.second.id, amount: 50, description: "Ice cream" },
  { budget_id: Budget.first.id, category_id: Category.third.id, amount: 100, description: "Gasoline" },
  { budget_id: Budget.first.id, category_id: Category.fourth.id, amount: 200, description: "Transport costs" },
  { budget_id: Budget.first.id, category_id: Category.fifth.id, amount: 300, description: "Personal care products" },

  { budget_id: Budget.second.id, category_id: Category.first.id, amount: 250, description: "Groceries" },
  { budget_id: Budget.second.id, category_id: Category.second.id, amount: 30, description: "Takeout food" },
  { budget_id: Budget.second.id, category_id: Category.third.id, amount: 80, description: "Bus pass" },
  { budget_id: Budget.second.id, category_id: Category.fourth.id, amount: 100, description: "Uber ride" },
  { budget_id: Budget.second.id, category_id: Category.fifth.id, amount: 120, description: "Haircut" },

  { budget_id: Budget.third.id, category_id: Category.first.id, amount: 350, description: "Supermarket shopping" },
  { budget_id: Budget.third.id, category_id: Category.second.id, amount: 60, description: "Lunch with friends" },
  { budget_id: Budget.third.id, category_id: Category.third.id, amount: 200, description: "Fuel" },
  { budget_id: Budget.third.id, category_id: Category.fourth.id, amount: 150, description: "Parking" },
  { budget_id: Budget.third.id, category_id: Category.fifth.id, amount: 250, description: "Spa treatment" },

  { budget_id: Budget.fourth.id, category_id: Category.first.id, amount: 180, description: "Weekly grocery shopping" },
  { budget_id: Budget.fourth.id, category_id: Category.second.id, amount: 40, description: "Dinner" },
  { budget_id: Budget.fourth.id, category_id: Category.third.id, amount: 90, description: "Gas station" },
  { budget_id: Budget.fourth.id, category_id: Category.fourth.id, amount: 70, description: "Train fare" },
  { budget_id: Budget.fourth.id, category_id: Category.fifth.id, amount: 130, description: "Facial treatment" },

  { budget_id: Budget.fifth.id, category_id: Category.first.id, amount: 1000, description: "Groceries for the week" },
  { budget_id: Budget.fifth.id, category_id: Category.second.id, amount: 150, description: "Dining out" },
  { budget_id: Budget.fifth.id, category_id: Category.third.id, amount: 200, description: "Fuel expenses" },
  { budget_id: Budget.fifth.id, category_id: Category.fourth.id, amount: 180, description: "Taxi ride" },
  { budget_id: Budget.fifth.id, category_id: Category.fifth.id, amount: 100, description: "Hair care" }
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
