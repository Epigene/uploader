User.where(email: "augusts.bautra@gmail.com").first_or_initialize.update!(password: "1qaz2wsx")
User.where(email: "admin@test.com").first_or_initialize.update!(password: "admin")

puts "All seeded!"
