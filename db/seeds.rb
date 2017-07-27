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


#Units
unit_1 = Unit.create!(
name: "Unit 1", next_unit: 2, prev_unit: nil)

  lesson_1 = Lesson.create!( name: "unit 1 lesson 1", unit_id: unit_1.id )

    question_1 = Question.create!( title: "lesson 1 question 1", lesson_id: lesson_1.id)
      answer_1 = Answer.create!(name: "A", question_id: question_1.id, value: true)
      answer_2 = Answer.create!(name: "B", question_id: question_1.id, value: false)
      answer_3 = Answer.create!(name: "C", question_id: question_1.id, value: false)

    question_2 = Question.create!( title: "lesson 1 question 2", lesson_id: lesson_1.id)
      answer_4 = Answer.create!(name: "A", question_id: question_2.id, value: true)
      answer_5 = Answer.create!(name: "B", question_id: question_2.id, value: false)
      answer_6 = Answer.create!(name: "C", question_id: question_2.id, value: false)

    question_3 = Question.create!( title: "lesson 1 question 3", lesson_id: lesson_1.id)
      answer_7 = Answer.create!(name: "A", question_id: question_3.id, value: true)
      answer_8 = Answer.create!(name: "B", question_id: question_3.id, value: false)
      answer_9 = Answer.create!(name: "C", question_id: question_3.id, value: false)

    question_4 = Question.create!( title: "lesson 1 question 4", lesson_id: lesson_1.id)
      answer_10 = Answer.create!(name: "A", question_id: question_4.id, value: true)
      answer_11 = Answer.create!(name: "B", question_id: question_4.id, value: false)
      answer_12 = Answer.create!(name: "C", question_id: question_4.id, value: false)

    question_5 = Question.create!( title: "lesson 1 question 5", lesson_id: lesson_1.id)
      answer_13 = Answer.create!(name: "A", question_id: question_5.id, value: true)
      answer_14 = Answer.create!(name: "B", question_id: question_5.id, value: false)
      answer_15 = Answer.create!(name: "C", question_id: question_5.id, value: false)

  lesson_2 = Lesson.create!( name: "unit 1 lesson 2", unit_id: unit_1.id )
    question_6 = Question.create!( title: "lesson 2 question 1", lesson_id: lesson_2.id)
      answer_16 = Answer.create!(name: "A", question_id: question_6.id, value: true)
      answer_17 = Answer.create!(name: "B", question_id: question_6.id, value: false)
      answer_18 = Answer.create!(name: "C", question_id: question_6.id, value: false)

    question_7 = Question.create!( title: "lesson 2 question 2", lesson_id: lesson_2.id)
      answer_19 = Answer.create!(name: "A", question_id: question_7.id, value: true)
      answer_20 = Answer.create!(name: "B", question_id: question_7.id, value: false)
      answer_21 = Answer.create!(name: "C", question_id: question_7.id, value: false)

    question_8 = Question.create!( title: "lesson 2 question 3", lesson_id: lesson_2.id)
      answer_22 = Answer.create!(name: "A", question_id: question_8.id, value: true)
      answer_23 = Answer.create!(name: "B", question_id: question_8.id, value: false)
      answer_24 = Answer.create!(name: "C", question_id: question_8.id, value: false)


unit_2 = Unit.create!(
name: "Unit 2", next_unit: 3, prev_unit: 1 )
  lesson_3 = Lesson.create!( name: "unit 2 lesson 1", unit_id: unit_2.id )
    question_9 = Question.create!( title: "lesson 3 question 1", lesson_id: lesson_3.id)
      answer_25 = Answer.create!(name: "A", question_id: question_9.id, value: true)
      answer_26 = Answer.create!(name: "B", question_id: question_9.id, value: false)
      answer_27 = Answer.create!(name: "C", question_id: question_9.id, value: false)

unit_3 = Unit.create!(
name: "Unit 3", next_unit: 4, prev_unit: 2 )
  lesson_4 = Lesson.create!( name: "unit 3 lesson 1", unit_id: unit_3.id )
    question_10 = Question.create!( title: "lesson 4 question 1", lesson_id: lesson_4.id)
      answer_28 = Answer.create!(name: "A", question_id: question_10.id, value: true)
      answer_29 = Answer.create!(name: "B", question_id: question_10.id, value: false)
      answer_30 = Answer.create!(name: "C", question_id: question_10.id, value: false)
    question_11 = Question.create!( title: "lesson 4 question 2", lesson_id: lesson_4.id)
      answer_31 = Answer.create!(name: "A", question_id: question_11.id, value: true)
      answer_32 = Answer.create!(name: "B", question_id: question_11.id, value: false)
      answer_33 = Answer.create!(name: "C", question_id: question_11.id, value: false)
  lesson_5 = Lesson.create!( name: "unit 3 lesson 2", unit_id: unit_3.id )
    question_12 = Question.create!( title: "lesson 1 question 1", lesson_id: lesson_5.id)
      answer_34 = Answer.create!(name: "A", question_id: question_12.id, value: true)
      answer_35 = Answer.create!(name: "B", question_id: question_12.id, value: false)
      answer_36 = Answer.create!(name: "C", question_id: question_12.id, value: false)
  lesson_6 = Lesson.create!( name: "unit 3 lesson 3", unit_id: unit_3.id )
    question_13 = Question.create!( title: "lesson 1 question 1", lesson_id: lesson_6.id)
      answer_37 = Answer.create!(name: "A", question_id: question_13.id, value: true)
      answer_38 = Answer.create!(name: "B", question_id: question_13.id, value: false)
      answer_39 = Answer.create!(name: "C", question_id: question_13.id, value: false)


#Users
User.create!(username: 'Guest', password: 'password', lesson_id: lesson_6.id, unit_id: unit_3.id)
User.create!(username: 'User1', password: 'password', lesson_id:lesson_1.id, unit_id: unit_1.id)
