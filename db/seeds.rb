User.destroy_all
Unit.destroy_all
Lesson.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


unit_1 = Unit.create!(
name: "Arithmatic", next_unit: 2, prev_unit: nil)

  lesson_1 = Lesson.create!( name: "Addition", unit_id: unit_1.id )

    question_1 = Question.create!( title: "3 + 4", lesson_id: lesson_1.id)
      Answer.create!(name: "7", question_id: question_1.id, value: true)
      Answer.create!(name: "6", question_id: question_1.id, value: false)
      Answer.create!(name: "10", question_id: question_1.id, value: false)

    question_2 = Question.create!( title: "5 + 2", lesson_id: lesson_1.id)
      Answer.create!(name: "3", question_id: question_2.id, value: false)
      Answer.create!(name: "7", question_id: question_2.id, value: true)
      Answer.create!(name: "8", question_id: question_2.id, value: false)

    question_3 = Question.create!( title: "9 + 1", lesson_id: lesson_1.id)
      Answer.create!(name: "10", question_id: question_3.id, value: true)
      Answer.create!(name: "8", question_id: question_3.id, value: false)
      Answer.create!(name: "9", question_id: question_3.id, value: false)

    question_4 = Question.create!( title: "5 + 3", lesson_id: lesson_1.id)
      Answer.create!(name: "2", question_id: question_4.id, value: false)
      Answer.create!(name: "9", question_id: question_4.id, value: false)
      Answer.create!(name: "8", question_id: question_4.id, value: true)

    question_5 = Question.create!( title: "2 + 4", lesson_id: lesson_1.id)
      Answer.create!(name: "8", question_id: question_5.id, value: false)
      Answer.create!(name: "5", question_id: question_5.id, value: false)
      Answer.create!(name: "6", question_id: question_5.id, value: true)

  lesson_2 = Lesson.create!( name: "Subtraction", unit_id: unit_1.id )
    question_6 = Question.create!( title: "6 - 5", lesson_id: lesson_2.id)
      Answer.create!(name: "1", question_id: question_6.id, value: true)
      Answer.create!(name: "8", question_id: question_6.id, value: false)
      Answer.create!(name: "4", question_id: question_6.id, value: false)

    question_7 = Question.create!( title: "7 - 3", lesson_id: lesson_2.id)
      Answer.create!(name: "5", question_id: question_7.id, value: false)
      Answer.create!(name: "9", question_id: question_7.id, value: false)
      Answer.create!(name: "4", question_id: question_7.id, value: true)

    question_8 = Question.create!( title: "9 - 4", lesson_id: lesson_2.id)
      Answer.create!(name: "6", question_id: question_8.id, value: false)
      Answer.create!(name: "5", question_id: question_8.id, value: true)
      Answer.create!(name: "0", question_id: question_8.id, value: false)

    question_8 = Question.create!( title: "6 - 2", lesson_id: lesson_2.id)
      Answer.create!(name: "4", question_id: question_8.id, value: true)
      Answer.create!(name: "3", question_id: question_8.id, value: false)
      Answer.create!(name: "7", question_id: question_8.id, value: false)

    question_8 = Question.create!( title: "3 - 3", lesson_id: lesson_2.id)
      Answer.create!(name: "0", question_id: question_8.id, value: true)
      Answer.create!(name: "3", question_id: question_8.id, value: false)
      Answer.create!(name: "6", question_id: question_8.id, value: false)

  lesson_3 = Lesson.create!( name: "Multiplication", unit_id: unit_1.id )
    question_6 = Question.create!( title: "2 * 3", lesson_id: lesson_3.id)
      Answer.create!(name: "8", question_id: question_6.id, value: false)
      Answer.create!(name: "6", question_id: question_6.id, value: true)
      Answer.create!(name: "4", question_id: question_6.id, value: false)

    question_7 = Question.create!( title: "6 * 1", lesson_id: lesson_3.id)
      Answer.create!(name: "5", question_id: question_7.id, value: false)
      Answer.create!(name: "9", question_id: question_7.id, value: false)
      Answer.create!(name: "6", question_id: question_7.id, value: true)

    question_8 = Question.create!( title: "7 * 3", lesson_id: lesson_3.id)
      Answer.create!(name: "28", question_id: question_8.id, value: false)
      Answer.create!(name: "21", question_id: question_8.id, value: true)
      Answer.create!(name: "10", question_id: question_8.id, value: false)

    question_8 = Question.create!( title: "4 * 5", lesson_id: lesson_3.id)
      Answer.create!(name: "9", question_id: question_8.id, value: false)
      Answer.create!(name: "25", question_id: question_8.id, value: false)
      Answer.create!(name: "20", question_id: question_8.id, value: true)

    question_8 = Question.create!( title: "3 * 3", lesson_id: lesson_3.id)
      Answer.create!(name: "9", question_id: question_8.id, value: true)
      Answer.create!(name: "3", question_id: question_8.id, value: false)
      Answer.create!(name: "6", question_id: question_8.id, value: false)

  lesson_4 = Lesson.create!( name: "Division", unit_id: unit_1.id )
      question_1 = Question.create!( title: "12 / 4", lesson_id: lesson_4.id)
        Answer.create!(name: "4", question_id: question_1.id, value: false)
        Answer.create!(name: "3", question_id: question_1.id, value: true)
        Answer.create!(name: "8", question_id: question_1.id, value: false)

      question_2 = Question.create!( title: "6 / 2", lesson_id: lesson_4.id)
        Answer.create!(name: "7", question_id: question_2.id, value: true)
        Answer.create!(name: "3", question_id: question_2.id, value: false)
        Answer.create!(name: "8", question_id: question_2.id, value: false)

      question_3 = Question.create!( title: "9 / 3", lesson_id: lesson_4.id)
        Answer.create!(name: "12", question_id: question_3.id, value: false)
        Answer.create!(name: "3", question_id: question_3.id, value: true)
        Answer.create!(name: "9", question_id: question_3.id, value: false)

      question_4 = Question.create!( title: "10 / 2", lesson_id: lesson_4.id)
        Answer.create!(name: "10", question_id: question_4.id, value: false)
        Answer.create!(name: "5", question_id: question_4.id, value: true)
        Answer.create!(name: "20", question_id: question_4.id, value: false)

      question_5 = Question.create!( title: "8 / 4", lesson_id: lesson_4.id)
        Answer.create!(name: "8", question_id: question_5.id, value: false)
        Answer.create!(name: "5", question_id: question_5.id, value: false)
        Answer.create!(name: "2", question_id: question_5.id, value: true)


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
      Answer.create!(name: "A", question_id: question_10.id, value: true)
      Answer.create!(name: "B", question_id: question_10.id, value: false)
      Answer.create!(name: "C", question_id: question_10.id, value: false)
    question_11 = Question.create!( title: "lesson 4 question 2", lesson_id: lesson_4.id)
      Answer.create!(name: "A", question_id: question_11.id, value: true)
      Answer.create!(name: "B", question_id: question_11.id, value: false)
      Answer.create!(name: "C", question_id: question_11.id, value: false)
  lesson_5 = Lesson.create!( name: "unit 3 lesson 2", unit_id: unit_3.id )
    question_12 = Question.create!( title: "lesson 1 question 1", lesson_id: lesson_5.id)
      Answer.create!(name: "A", question_id: question_12.id, value: true)
      Answer.create!(name: "B", question_id: question_12.id, value: false)
      Answer.create!(name: "C", question_id: question_12.id, value: false)
  lesson_6 = Lesson.create!( name: "unit 3 lesson 3", unit_id: unit_3.id )
    question_13 = Question.create!( title: "lesson 1 question 1", lesson_id: lesson_6.id)
      Answer.create!(name: "A", question_id: question_13.id, value: true)
      Answer.create!(name: "B", question_id: question_13.id, value: false)
      Answer.create!(name: "C", question_id: question_13.id, value: false)


#Users
User.create!(username: 'Guest', password: 'password', lesson_id: lesson_1.id, unit_id: unit_1.id)
User.create!(username: 'User1', password: 'password', lesson_id:lesson_1.id, unit_id: unit_1.id)
