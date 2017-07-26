json.set! "lesson" do
  json.set! @lesson.id do
    json.id @lesson.id
    json.name @lesson.name
  end
end
json.set! "questions" do
  @lesson.questions.each do |question|
    json.set! question.id do
      json.id question.id
      json.name question.title
      json.set! "answer" do
        question.answers.each do |ans|
          json.set! ans.id do
            json.id ans.id
            json.name ans.name
            json.value ans.value
          end
        end
      end
    end
  end
end
