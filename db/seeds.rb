puts "--- Generate User"

user = User.create!(
  first_name: "Harshil",
  last_name: "Siyani",
  email: "harshil@expense.com",
  password: "abc123"
  )

user = User.create!(
  first_name: "Dikesh",
  last_name: "Vekeria",
  email: "dikesh@expense.com",
  password: "abc123",
  accounts: true
  )
puts "Finished User creation"

puts "Seeding Departments"

department = Department.create!(
  name: "Media",
  head_id: 1,
  )
puts "Department: Media seeded"

department = Department.create!(
  name:"Development",
  head_id: 2,
  )
puts "Department: Development seeded"

puts "Seeding Receipts"
count = 1;
receipt_file = File.open('db/receipts_data/receipts.json').read
JSON.parse(receipt_file).each do |record|
  receipt = Receipt.new({
    amount: record["amount"],
    description: record["description"],
    date: record["date"],
    department_id: record["department_id"],
    owner_id: record["owner_id"],
    status: record["status"],
    paid: record["paid"]
  })
  if receipt.save!
    puts "Receipt number #{count}";
    count += 1;
  else
    puts "Error at receipt number #{count}";
  end
end
puts "Finished seeding Receipts"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
