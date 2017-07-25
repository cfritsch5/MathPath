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

User.create!(username: 'Guest', password: 'password')

User.create!(username: 'User1', password: 'password')

unit_1 = Unit.create!(
name: "Unit 1", next_unit: 2, prev_unit: nil)

unit_2 = Unit.create!(
name: "Unit 2", next_unit: 3, prev_unit: 1 )

unit_3 = Unit.create!( name: "Unit 3", next_unit: 4, prev_unit: 2 )

lesson_1 = Lesson.create!( name: "unit 1 lesson 1", unit_id: unit_1.id )

lesson_2 = Lesson.create!( name: "unit 1 lesson 2", unit_id: unit_1.id )

lesson_3 = Lesson.create!( name: "unit 2 lesson 1", unit_id: unit_2.id )

lesson_4 = Lesson.create!( name: "unit 3 lesson 1", unit_id: unit_3.id )

lesson_5 = Lesson.create!( name: "unit 3 lesson 2", unit_id: unit_3.id )

lesson_6 = Lesson.create!( name: "unit 3 lesson 3", unit_id: unit_3.id )

question_1 = Question.create!( title: "lesson 1 question 1", lesson_id: lesson_1.id)
question_2 = Question.create!( title: "lesson 1 question 2", lesson_id: lesson_1.id)

question_3 = Question.create!( title: "lesson 2 question 1", lesson_id: lesson_2.id)
question_4 = Question.create!( title: "lesson 2 question 2", lesson_id: lesson_2.id)
question_5 = Question.create!( title: "lesson 2 question 3", lesson_id: lesson_2.id)

question_6 = Question.create!( title: "lesson 3 question 1", lesson_id: lesson_3.id)


question_7 = Question.create!( title: "lesson 4 question 1", lesson_id: lesson_4.id)
question_8 = Question.create!( title: "lesson 4 question 2", lesson_id: lesson_4.id)

question_9 = Question.create!( title: "lesson 1 question 1", lesson_id: lesson_5.id)

question_10 = Question.create!( title: "lesson 1 question 1", lesson_id: lesson_6.id)
