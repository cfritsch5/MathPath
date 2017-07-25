# User.destroy_all
# Unit.destroy_all
# Lesson.destroy_all

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

User.create!(
username: 'User1',
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

lesson_1 = Lesson.create!(
name: "Addition",
unit_id: unit_1.id
)

lesson_2 = Lesson.create!(
name: "Subtraction",
unit_id: unit_1.id
)

lesson_3 = Lesson.create!(
name: "Addition",
unit_id: unit_2.id
)

lesson_4 = Lesson.create!(
name: "Subtraction",
unit_id: unit_3.id
)

lesson_5 = Lesson.create!(
name: "Subtraction",
unit_id: unit_3.id
)

lesson_6 = Lesson.create!(
name: "Subtraction",
unit_id: unit_3.id
)
