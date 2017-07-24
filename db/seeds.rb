# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
username: 'Guest',
password: 'password'
)

unit_1 = Unit.create!(
name: "Integer Arithmatic",
next_unit: 2,
prev_unit: nil
)

unit_2 = Unit.create!(
name: "Algebraic Expressions",
next_unit: 3,
prev_unit: 1
)

unit_3 = Unit.create!(
name: "Equations 1",
next_unit: 4,
prev_unit: 2
)

unit_4 = Unit.create!(
name: "Inequality Equations",
next_unit: 5,
prev_unit: 3
)

unit_5 = Unit.create!(
name: "Absolute Value Equations",
next_unit: 6,
prev_unit: 4
)


unit_6 = Unit.create!(
name: "Proportions",
next_unit: nil,
prev_unit: 5
)

Lesson.create!(
name: "Addition",
unit_id: unit_1.id 
)
