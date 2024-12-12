puts "Clearing existing records..."
Expense.destroy_all
Budget.destroy_all
Category.destroy_all
Goal.destroy_all
User.destroy_all
puts "All old records destroyed."

puts "Creating user..."
user = User.create!(
  email: "test@test.com",
  password: "123456"
)
puts "User created: #{user.email}"

# Helper method to generate a realistic date within a given month of 2024
def random_date_in_month(year, month)
  # Ensure the month is valid and year is set. For the demo in December 2024,
  # we'll assume historical budgets for previous months of 2024.
  day = rand(1..28) # keep it simple, to avoid invalid dates for short months
  DateTime.new(year, month, day, rand(8..23), rand(0..59))
end

puts "Creating categories..."
categories = [
  "Concert Tickets",
  "Luxury Hotels",
  "Designer Clothes",
  "Chainz & Bling",
  "Bottles at the Club",
  "Hypebeast Gear",
  "Exclusive Sneaker Drops",
  "Exotic Car Rentals"
].map do |cat_name|
  Category.create!(name: cat_name, user: user)
end
puts "Created #{categories.count} categories."

puts "Creating goals..."
goals = [
  { title: "Lambo with flame throwers", target_amount: 2500000.0, due_date: Date.new(2024,12,31), achieved: false, description: "For my Mother" },
  { title: "Jetski", target_amount: 50000.0, due_date: Date.new(2025,1,15), achieved: false, description: "To do flips and tricks" },
  { title: "A limited edition Sword", target_amount: 10000.0, due_date: Date.new(2024,11,1), achieved: true, description: "I want this" },
].map { |g| Goal.create!(g.merge(user: user)) }
puts "Created #{goals.count} goals."

puts "Creating budgets and expenses..."

# We'll create budgets for a few previous months plus December for the demo.
# Let's say from September (9) to December (12)
budgets_data = [
  { month: 8,  total_amount: 8000.0,  review: "September was all about that NYC Fashion Week drip." },
  { month: 9, total_amount: 12000.0, review: "October got spooky with high-end parties." },
  { month: 10, total_amount: 15000.0, review: "November included early holiday shopping and some chill events." },
  { month: 11, total_amount: 20000.0, review: "December: end of year blowout, lavish gifts and celebrations." }
]

budgets_data.each do |b_data|
  budget = Budget.create!(
    user: user,
    month: b_data[:month],
    total_amount: b_data[:total_amount],
    review: b_data[:review]
  )

  # For each budget, create a handful of expenses.
  # We'll pick random categories and assign expenses within that month.

  expense_count = case b_data[:month]
                  when 8 then 7 # fewer in December so far, maybe will add more later?
                  when 9  then 5
                  when 10 then 6
                  when 11 then 4
                  end

  expense_count.times do
    cat = categories.sample
    expense_amount = rand(100..3000).to_f

    # Description and content vary by category to give some realism
    description, content, review = case cat.name
    when "Concert Tickets"
      [
        "Front row seat at a major show.",
        "Splurged on VIP tickets.",
        "Worth every penny for that front-row experience."
      ]
    when "Luxury Hotels"
      [
        "Stayed at The Ritz for a weekend.",
        "Suite upgrade with late checkout.",
        "Lavish room service and spa treatments."
      ]
    when "Designer Clothes"
      [
        "Picked up new Louis Vuitton pieces.",
        "Limited edition collab drop.",
        "High-fashion drip on point."
      ]
    when "Chainz & Bling"
      [
        "New diamond-studded pendant.",
        "Custom iced-out grill.",
        "Shining brighter than the stage lights."
      ]
    when "Bottles at the Club"
      [
        "VIP table bottle service.",
        "Popped some Ace of Spades.",
        "Party all night, no regrets."
      ]
    when "Hypebeast Gear"
      [
        "Copped some Supreme & BAPE.",
        "New Off-White hoodie.",
        "Streetwear dripping all day."
      ]
    when "Exclusive Sneaker Drops"
      [
        "Got the latest Jordans on release.",
        "Yeezy season never ends.",
        "Feet got more ice than my neck."
      ]
    when "Exotic Car Rentals"
      [
        "Whipped a Lambo for the weekend.",
        "Rented a Bentley Bentayga.",
        "Cruising the city in style."
      ]
    end

    # The date for the expense must match the budget month
    expense_date = random_date_in_month(2024, b_data[:month])

    Expense.create!(
      amount: expense_amount,
      description: description,
      date: expense_date,
      category: cat,
      budget: budget,
      content: content,
      review: review
    )
  end
  puts "Created #{expense_count} expenses for month #{b_data[:month]}."
end

puts "Seeding complete!"
