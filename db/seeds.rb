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


unit_0 = Unit.create!(name: "Demo Unit", next_unit: 1, prev_unit: nil)
  lesson_1 = Lesson.create!( name: "Welcome Lesson", unit_id: unit_0.id )
    question_1 = Question.create!( title: "Welcome to Math Path. Each question has one correct answer.", lesson_id: lesson_1.id)
      Answer.create!(name: "Incorrect ✘", question_id: question_1.id, value: false)
      Answer.create!(name: "Correct ✔", question_id: question_1.id, value: true)
      Answer.create!(name: "Incorrect ✘", question_id: question_1.id, value: false)
    question_2 = Question.create!( title: "Each Lesson will be unlocked when you pass the previous lesson", lesson_id: lesson_1.id)
      # Answer.create!(name: "✘", question_id: question_2.id, value: false)
      Answer.create!(name: "Got it", question_id: question_2.id, value: true)
      # Answer.create!(name: "✘", question_id: question_2.id, value: false)
    question_4 = Question.create!( title: "Each Unit will be unlocked when you pass all of the Lessons in the previous unit", lesson_id: lesson_1.id)
      # Answer.create!(name: "✘", question_id: question_4.id, value: false)
      Answer.create!(name: "Got it", question_id: question_4.id, value: true)
      # Answer.create!(name: "✘", question_id: question_4.id, value: false)
      question_3 = Question.create!( title: "You can see your results at the end of the lesson", lesson_id: lesson_1.id)
        # Answer.create!(name: "✘", question_id: question_3.id, value: false)
        Answer.create!(name: "Show Me", question_id: question_3.id, value: true)
        # Answer.create!(name: "✘", question_id: question_3.id, value: false)
    # lesson_1 = Lesson.create!( name: "Second Lesson", unit_id: unit_0.id )

unit_1 = Unit.create!(
name: "Arithmetic", next_unit: 2, prev_unit: 0)

  lesson_1 = Lesson.create!( name: "Addition", unit_id: unit_1.id)
  start_lesson = lesson_1
    question_1 = Question.create!( title: "3 + 4 = ", lesson_id: lesson_1.id)
      Answer.create!(name: "7", question_id: question_1.id, value: true)
      Answer.create!(name: "6", question_id: question_1.id, value: false)
      Answer.create!(name: "10", question_id: question_1.id, value: false)

    question_2 = Question.create!( title: "5 + 2 = ", lesson_id: lesson_1.id)
      Answer.create!(name: "3", question_id: question_2.id, value: false)
      Answer.create!(name: "7", question_id: question_2.id, value: true)
      Answer.create!(name: "8", question_id: question_2.id, value: false)

    question_3 = Question.create!( title: "9 + 1 = ", lesson_id: lesson_1.id)
      Answer.create!(name: "10", question_id: question_3.id, value: true)
      Answer.create!(name: "8", question_id: question_3.id, value: false)
      Answer.create!(name: "9", question_id: question_3.id, value: false)

    question_4 = Question.create!( title: "5 + 3 = ", lesson_id: lesson_1.id)
      Answer.create!(name: "2", question_id: question_4.id, value: false)
      Answer.create!(name: "9", question_id: question_4.id, value: false)
      Answer.create!(name: "8", question_id: question_4.id, value: true)

    question_5 = Question.create!( title: "2 + 4 = ", lesson_id: lesson_1.id)
      Answer.create!(name: "8", question_id: question_5.id, value: false)
      Answer.create!(name: "5", question_id: question_5.id, value: false)
      Answer.create!(name: "6", question_id: question_5.id, value: true)

  lesson_2 = Lesson.create!( name: "Subtraction", unit_id: unit_1.id )
    question_6 = Question.create!( title: "6 - 5 = ", lesson_id: lesson_2.id)
      Answer.create!(name: "1", question_id: question_6.id, value: true)
      Answer.create!(name: "8", question_id: question_6.id, value: false)
      Answer.create!(name: "4", question_id: question_6.id, value: false)

    question_7 = Question.create!( title: "7 - 3 = ", lesson_id: lesson_2.id)
      Answer.create!(name: "5", question_id: question_7.id, value: false)
      Answer.create!(name: "9", question_id: question_7.id, value: false)
      Answer.create!(name: "4", question_id: question_7.id, value: true)

    question_8 = Question.create!( title: "9 - 4 = ", lesson_id: lesson_2.id)
      Answer.create!(name: "6", question_id: question_8.id, value: false)
      Answer.create!(name: "5", question_id: question_8.id, value: true)
      Answer.create!(name: "0", question_id: question_8.id, value: false)

    question_8 = Question.create!( title: "6 - 2 = ", lesson_id: lesson_2.id)
      Answer.create!(name: "4", question_id: question_8.id, value: true)
      Answer.create!(name: "3", question_id: question_8.id, value: false)
      Answer.create!(name: "7", question_id: question_8.id, value: false)

    question_8 = Question.create!( title: "3 - 3 = ", lesson_id: lesson_2.id)
      Answer.create!(name: "0", question_id: question_8.id, value: true)
      Answer.create!(name: "3", question_id: question_8.id, value: false)
      Answer.create!(name: "6", question_id: question_8.id, value: false)

  lesson_3 = Lesson.create!( name: "Multiplication", unit_id: unit_1.id )
    question_6 = Question.create!( title: "2 * 3 = ", lesson_id: lesson_3.id)
      Answer.create!(name: "8", question_id: question_6.id, value: false)
      Answer.create!(name: "6", question_id: question_6.id, value: true)
      Answer.create!(name: "4", question_id: question_6.id, value: false)

    question_7 = Question.create!( title: "6 * 1 = ", lesson_id: lesson_3.id)
      Answer.create!(name: "5", question_id: question_7.id, value: false)
      Answer.create!(name: "9", question_id: question_7.id, value: false)
      Answer.create!(name: "6", question_id: question_7.id, value: true)

    question_8 = Question.create!( title: "7 * 3 = ", lesson_id: lesson_3.id)
      Answer.create!(name: "28", question_id: question_8.id, value: false)
      Answer.create!(name: "21", question_id: question_8.id, value: true)
      Answer.create!(name: "10", question_id: question_8.id, value: false)

    question_8 = Question.create!( title: "4 * 5 = ", lesson_id: lesson_3.id)
      Answer.create!(name: "9", question_id: question_8.id, value: false)
      Answer.create!(name: "25", question_id: question_8.id, value: false)
      Answer.create!(name: "20", question_id: question_8.id, value: true)

    question_8 = Question.create!( title: "3 * 3 = ", lesson_id: lesson_3.id)
      Answer.create!(name: "9", question_id: question_8.id, value: true)
      Answer.create!(name: "3", question_id: question_8.id, value: false)
      Answer.create!(name: "6", question_id: question_8.id, value: false)

  lesson_4 = Lesson.create!( name: "Division", unit_id: unit_1.id )
      question_1 = Question.create!( title: "12 / 4 = ", lesson_id: lesson_4.id)
        Answer.create!(name: "4", question_id: question_1.id, value: false)
        Answer.create!(name: "3", question_id: question_1.id, value: true)
        Answer.create!(name: "8", question_id: question_1.id, value: false)

      question_2 = Question.create!( title: "6 / 2 = ", lesson_id: lesson_4.id)
        Answer.create!(name: "7", question_id: question_2.id, value: false)
        Answer.create!(name: "3", question_id: question_2.id, value: true)
        Answer.create!(name: "8", question_id: question_2.id, value: false)

      question_3 = Question.create!( title: "9 / 3 = ", lesson_id: lesson_4.id)
        Answer.create!(name: "12", question_id: question_3.id, value: false)
        Answer.create!(name: "3", question_id: question_3.id, value: true)
        Answer.create!(name: "9", question_id: question_3.id, value: false)

      question_4 = Question.create!( title: "10 / 2 = ", lesson_id: lesson_4.id)
        Answer.create!(name: "10", question_id: question_4.id, value: false)
        Answer.create!(name: "5", question_id: question_4.id, value: true)
        Answer.create!(name: "20", question_id: question_4.id, value: false)

      question_5 = Question.create!( title: "8 / 4 = ", lesson_id: lesson_4.id)
        Answer.create!(name: "8", question_id: question_5.id, value: false)
        Answer.create!(name: "5", question_id: question_5.id, value: false)
        Answer.create!(name: "2", question_id: question_5.id, value: true)

  unit_2 = Unit.create!(
  name: "Expressions", next_unit: 3, prev_unit: 1)

    lesson_1 = Lesson.create!( name: "Order of Operations - 1", unit_id: unit_2.id )

      question_1 = Question.create!( title: "3 x 3 - 2 = ", lesson_id: lesson_1.id)
        Answer.create!(name: "7", question_id: question_1.id, value: true)
        Answer.create!(name: "6", question_id: question_1.id, value: false)
        Answer.create!(name: "10", question_id: question_1.id, value: false)

      question_2 = Question.create!( title: "8 ÷ (3 + 1) = ", lesson_id: lesson_1.id)
        Answer.create!(name: "3", question_id: question_2.id, value: false)
        Answer.create!(name: "2", question_id: question_2.id, value: true)
        Answer.create!(name: "8", question_id: question_2.id, value: false)

      question_3 = Question.create!( title: "1 + 4 ÷ 2 = ", lesson_id: lesson_1.id)
        Answer.create!(name: "4", question_id: question_3.id, value: false)
        Answer.create!(name: "3", question_id: question_3.id, value: true)
        Answer.create!(name: "7", question_id: question_3.id, value: false)

      question_4 = Question.create!( title: "12 ÷ 4 + 2 x 3 = ", lesson_id: lesson_1.id)
        Answer.create!(name: "6", question_id: question_4.id, value: false)
        Answer.create!(name: "8", question_id: question_4.id, value: false)
        Answer.create!(name: "9", question_id: question_4.id, value: true)

      question_5 = Question.create!( title: "12 ÷ 4 + 2 + 1 = ", lesson_id: lesson_1.id)
        Answer.create!(name: "8", question_id: question_5.id, value: false)
        Answer.create!(name: "5", question_id: question_5.id, value: false)
        Answer.create!(name: "6", question_id: question_5.id, value: true)

    lesson_2 = Lesson.create!( name: "Order of Operations - 2", unit_id: unit_2.id )
      question_6 = Question.create!( title: "3(6 - 5)", lesson_id: lesson_2.id)
        Answer.create!(name: "9", question_id: question_6.id, value: false)
        Answer.create!(name: "6", question_id: question_6.id, value: false)
        Answer.create!(name: "3", question_id: question_6.id, value: true)

      question_7 = Question.create!( title: "8(8-6) - 12 = ", lesson_id: lesson_2.id)
        Answer.create!(name: "80", question_id: question_7.id, value: false)
        Answer.create!(name: "48", question_id: question_7.id, value: false)
        Answer.create!(name: "4", question_id: question_7.id, value: true)

      question_8 = Question.create!( title: "7 + 2(3-1) = ", lesson_id: lesson_2.id)
        Answer.create!(name: "12", question_id: question_8.id, value: false)
        Answer.create!(name: "11", question_id: question_8.id, value: true)
        Answer.create!(name: "7", question_id: question_8.id, value: false)

      question_8 = Question.create!( title: "8 ÷ 8 + 6 ÷ 3 = ", lesson_id: lesson_2.id)
        Answer.create!(name: "4", question_id: question_8.id, value: false)
        Answer.create!(name: "3", question_id: question_8.id, value: true)
        Answer.create!(name: "7", question_id: question_8.id, value: false)

      question_8 = Question.create!( title: "9 ÷ (12 ÷ 4) = ", lesson_id: lesson_2.id)
        Answer.create!(name: "9", question_id: question_8.id, value: false)
        Answer.create!(name: "3", question_id: question_8.id, value: true)
        Answer.create!(name: "6", question_id: question_8.id, value: false)

    lesson_3 = Lesson.create!( name: "Simplyfing with Variables", unit_id: unit_2.id )
      question_6 = Question.create!( title: "2x * 4 + 1 = ", lesson_id: lesson_3.id)
      Answer.create!(name: "8x + 1", question_id: question_6.id, value: true)
        Answer.create!(name: "10x", question_id: question_6.id, value: false)
        Answer.create!(name: "9", question_id: question_6.id, value: false)

      question_7 = Question.create!( title: "3x + 9 + x = ", lesson_id: lesson_3.id)
        Answer.create!(name: "12x", question_id: question_7.id, value: false)
        Answer.create!(name: "3x + 9x", question_id: question_7.id, value: false)
        Answer.create!(name: "4x + 9", question_id: question_7.id, value: true)

      question_8 = Question.create!( title: "2 * 5x * 1 + 3 * 2x = ", lesson_id: lesson_3.id)
        Answer.create!(name: "5x * 3 + 3", question_id: question_8.id, value: false)
        Answer.create!(name: "16x", question_id: question_8.id, value: true)
        Answer.create!(name: "16x + 4", question_id: question_8.id, value: false)

      question_8 = Question.create!( title: "7x + 1 ÷ 1 * 8  = ", lesson_id: lesson_3.id)
        Answer.create!(name: "7x + 1/8", question_id: question_8.id, value: false)
        Answer.create!(name: "8x + 8", question_id: question_8.id, value: false)
        Answer.create!(name: "7x + 8", question_id: question_8.id, value: true)

      question_8 = Question.create!( title: "3 * 3x * 0 = ", lesson_id: lesson_3.id)
        Answer.create!(name: "0", question_id: question_8.id, value: true)
        Answer.create!(name: "3", question_id: question_8.id, value: false)
        Answer.create!(name: "9x", question_id: question_8.id, value: false)

unit_3 = Unit.create!(name: "Equations", next_unit: 4, prev_unit: 2)
lesson_1 = Lesson.create!( name: "Introduction to equations", unit_id: unit_3.id)
  question_1 = Question.create!( title: "3 + x = 7", lesson_id: lesson_1.id)
    Answer.create!(name: "x = 4", question_id: question_1.id, value: true)
    Answer.create!(name: "x = 7", question_id: question_1.id, value: false)
    Answer.create!(name: "x = -4", question_id: question_1.id, value: false)

  question_2 = Question.create!( title: "5 + 2x = 9", lesson_id: lesson_1.id)
    Answer.create!(name: "x = 8", question_id: question_2.id, value: false)
    Answer.create!(name: "x = 2", question_id: question_2.id, value: true)
    Answer.create!(name: "x = 5", question_id: question_2.id, value: false)

  question_3 = Question.create!( title: "9 + 1 = x", lesson_id: lesson_1.id)
    Answer.create!(name: "x = 10", question_id: question_3.id, value: true)
    Answer.create!(name: "x = 8", question_id: question_3.id, value: false)
    Answer.create!(name: "x = 7", question_id: question_3.id, value: false)

  question_4 = Question.create!( title: "5x = 2 + 3", lesson_id: lesson_1.id)
    Answer.create!(name: "x = 10", question_id: question_4.id, value: false)
    Answer.create!(name: "x = 5", question_id: question_4.id, value: false)
    Answer.create!(name: "x = 1", question_id: question_4.id, value: true)

  question_5 = Question.create!( title: "2 - 4x = 14", lesson_id: lesson_1.id)
    Answer.create!(name: "x = 9", question_id: question_5.id, value: false)
    Answer.create!(name: "x = 3", question_id: question_5.id, value: false)
    Answer.create!(name: "x = -3", question_id: question_5.id, value: true)

lesson_2 = Lesson.create!( name: "Equations - 2", unit_id: unit_3.id)
  question_1 = Question.create!( title: "3 + 7x = 10", lesson_id: lesson_2.id)
    Answer.create!(name: "x = 6", question_id: question_1.id, value: false)
    Answer.create!(name: "x = 4", question_id: question_1.id, value: false)
    Answer.create!(name: "x = 1", question_id: question_1.id, value: true)

  question_2 = Question.create!( title: "5 + 2(x + 1) = 9", lesson_id: lesson_2.id)
    Answer.create!(name: "x = 8", question_id: question_2.id, value: false)
    Answer.create!(name: "x = 1", question_id: question_2.id, value: true)
    Answer.create!(name: "x = 5", question_id: question_2.id, value: false)

  question_3 = Question.create!( title: "9 - 1 = 8(x - 1)", lesson_id: lesson_2.id)
    Answer.create!(name: "x = 2", question_id: question_3.id, value: true)
    Answer.create!(name: "x = 8", question_id: question_3.id, value: false)
    Answer.create!(name: "x = 9", question_id: question_3.id, value: false)

unit_4 = Unit.create!(name: "Inequalities", next_unit: 5, prev_unit: 3)
lesson_1 = Lesson.create!( name: "Introduction to Inequalities", unit_id: unit_4.id)
last_lesson = lesson_1
  question_1 = Question.create!( title: "3 < 7", lesson_id: lesson_1.id)
    Answer.create!(name: "true", question_id: question_1.id, value: true)
    Answer.create!(name: "false", question_id: question_1.id, value: false)

  question_2 = Question.create!( title: "5 > 9", lesson_id: lesson_1.id)
    Answer.create!(name: "true", question_id: question_2.id, value: false)
    Answer.create!(name: "false", question_id: question_2.id, value: true)    # Answer.create!(name: "undetermined", question_id: question_2.id, value: false)

  question_3 = Question.create!( title: "9 => 8", lesson_id: lesson_1.id)
    Answer.create!(name: "true", question_id: question_3.id, value: true)
    Answer.create!(name: "false", question_id: question_3.id, value: false)

  question_4 = Question.create!( title: "5 <= 5", lesson_id: lesson_1.id)
    Answer.create!(name: "true", question_id: question_4.id, value: true)
    Answer.create!(name: "false", question_id: question_4.id, value: false)

  question_5 = Question.create!( title: "6 > 4", lesson_id: lesson_1.id)
    Answer.create!(name: "true", question_id: question_5.id, value: true)
    Answer.create!(name: "false", question_id: question_5.id, value: false)


#Users
User.create!(username: 'Guest', password: 'password', lesson_id: last_lesson.id, unit_id: unit_1.id)
User.create!(username: 'User1', password: 'password', lesson_id: start_lesson.id, unit_id: unit_1.id)
