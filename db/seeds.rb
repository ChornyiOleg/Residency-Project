# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Country.create(
  name: 'Portugal'
)

Country.create(
  name: 'Panama'
)

Country.create(
  name: 'Montenegro'
)

Program.create(
  name: 'Citizenship'
)

Program.create(
  name: 'Residency'
)

Administrator.create(
  email: 'test@email.com',
  password: '12345678',
  first_name: 'QWE',
  last_name: 'RTY'
)
