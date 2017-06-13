User.where(email: "augusts.bautra@gmail.com").first_or_initialize.update!(password: "1qaz2wsx")

puts "All seeded!"
