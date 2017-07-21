# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Unit.create!(
name: "unit 1",
next_unit: 2,
prev_unit: nil
)

Unit.create!(
name: "unit 2",
next_unit: 3,
prev_unit: 1
)

Unit.create!(
name: "unit 3",
next_unit: 4,
prev_unit: 2
)

Unit.create!(
name: "unit 4",
next_unit: 5,
prev_unit: 3
)

Unit.create!(
name: "unit 5",
next_unit: 6,
prev_unit: 4
)


Unit.create!(
name: "unit 6",
next_unit: nil,
prev_unit: 5
)
