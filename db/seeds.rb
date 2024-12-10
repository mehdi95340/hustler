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
   { user_id: User.first.id, month: 0, total_amount: 1023},
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

  # Generate expense attributes for each category
categories_expenses = {
  "Entertainment" => [
    { amount: 150.0, description: "Movie tickets", date: Time.current - 3.days },
    { amount: 50.0, description: "Streaming subscription", date: Time.current - 15.days },
    { amount: 80.0, description: "Concert ticket", date: Time.current - 25.days }
  ],
  "Restaurant" => [
    { amount: 60.0, description: "Dinner at a fancy place", date: Time.current - 2.days },
    { amount: 20.0, description: "Lunch with colleagues", date: Time.current - 10.days },
    { amount: 35.0, description: "Weekend brunch", date: Time.current - 20.days }
  ],
  "Groceries" => [
    { amount: 200.0, description: "Weekly grocery shopping", date: Time.current - 7.days },
    { amount: 45.0, description: "Quick trip for fresh produce", date: Time.current - 14.days },
    { amount: 120.0, description: "Monthly bulk shopping", date: Time.current - 30.days }
  ],
  "Transport" => [
    { amount: 100.0, description: "Monthly metro pass", date: Time.current - 1.days },
    { amount: 15.0, description: "Ride-share to work", date: Time.current - 9.days },
    { amount: 60.0, description: "Gas refill", date: Time.current - 18.days }
  ],
  "Personal Care" => [
    { amount: 45.0, description: "Haircut", date: Time.current - 5.days },
    { amount: 25.0, description: "Skincare products", date: Time.current - 12.days },
    { amount: 15.0, description: "Gym session", date: Time.current - 28.days }
  ],
  "Subscriptions Digital..." => [
    { amount: 15.0, description: "Music streaming subscription", date: Time.current - 6.days },
    { amount: 12.0, description: "Cloud storage plan", date: Time.current - 13.days },
    { amount: 20.0, description: "Online course subscription", date: Time.current - 29.days }
  ],
  "Spaceships Cars..." => [
    { amount: 500.0, description: "Spaceship fuel", date: Time.current - 3.days },
    { amount: 300.0, description: "Spaceship maintenance", date: Time.current - 21.days }
  ],
  "Ice Jewels..." => [
    { amount: 2000.0, description: "Rare diamond necklace", date: Time.current - 17.days },
    { amount: 1200.0, description: "Sapphire bracelet", date: Time.current - 25.days }
  ],
  "Drip Clothes..." => [
    { amount: 300.0, description: "Luxury shoes", date: Time.current - 7.days },
    { amount: 150.0, description: "Designer hoodie", date: Time.current - 19.days }
  ]
}

categories.each do |categories_attributes|
  category = Category.create!(categories_attributes)
end


  budgets = Budget.all
  categories = Category.all
  budgets.each do |budget|
    categories.each do |category|
      categories_expenses[category.name].each do |expense_attributes|
        expense = Expense.new(expense_attributes)
        expense.category = category
        expense.budget = budget
        expense.save!
      end
    end

  end

  # Create expenses


#   expenses = [
#   { budget_id: Budget.first.id, category_id: Category.first.id, amount: 1500, description: "Weekly groceries" },
#   { budget_id: Budget.first.id, category_id: Category.second.id, amount: 50, description: "Ice cream" },
#   { budget_id: Budget.first.id, category_id: Category.third.id, amount: 100, description: "Gasoline" },
#   { budget_id: Budget.first.id, category_id: Category.fourth.id, amount: 200, description: "Transport costs" },
#   { budget_id: Budget.first.id, category_id: Category.fifth.id, amount: 300, description: "Personal care products" },

#   { budget_id: Budget.second.id, category_id: Category.first.id, amount: 250, description: "Groceries" },
#   { budget_id: Budget.second.id, category_id: Category.second.id, amount: 30, description: "Takeout food" },
#   { budget_id: Budget.second.id, category_id: Category.third.id, amount: 80, description: "Bus pass" },
#   { budget_id: Budget.second.id, category_id: Category.fourth.id, amount: 100, description: "Uber ride" },
#   { budget_id: Budget.second.id, category_id: Category.fifth.id, amount: 120, description: "Haircut" },

#   { budget_id: Budget.third.id, category_id: Category.first.id, amount: 350, description: "Supermarket shopping" },
#   { budget_id: Budget.third.id, category_id: Category.second.id, amount: 60, description: "Lunch with friends" },
#   { budget_id: Budget.third.id, category_id: Category.third.id, amount: 200, description: "Fuel" },
#   { budget_id: Budget.third.id, category_id: Category.fourth.id, amount: 150, description: "Parking" },
#   { budget_id: Budget.third.id, category_id: Category.fifth.id, amount: 250, description: "Spa treatment" },

#   { budget_id: Budget.fourth.id, category_id: Category.first.id, amount: 180, description: "Weekly grocery shopping" },
#   { budget_id: Budget.fourth.id, category_id: Category.second.id, amount: 40, description: "Dinner" },
#   { budget_id: Budget.fourth.id, category_id: Category.third.id, amount: 90, description: "Gas station" },
#   { budget_id: Budget.fourth.id, category_id: Category.fourth.id, amount: 70, description: "Train fare" },
#   { budget_id: Budget.fourth.id, category_id: Category.fifth.id, amount: 130, description: "Facial treatment" },

#   { budget_id: Budget.fifth.id, category_id: Category.first.id, amount: 1000, description: "Groceries for the week" },
#   { budget_id: Budget.fifth.id, category_id: Category.second.id, amount: 150, description: "Dining out" },
#   { budget_id: Budget.fifth.id, category_id: Category.third.id, amount: 200, description: "Fuel expenses" },
#   { budget_id: Budget.fifth.id, category_id: Category.fourth.id, amount: 180, description: "Taxi ride" },
#   { budget_id: Budget.fifth.id, category_id: Category.fifth.id, amount: 100, description: "Hair care" }
# ]


#  expenses.each do |expense_attributes|
#   Expense.create!(expense_attributes)
#  end

  puts "Seeds was created succesfully! with #{Expense.count} expenses"

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
