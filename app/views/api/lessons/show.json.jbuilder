json.id @lesson.id
json.name @lesson.name
json.set! "questions" do
  @lesson.questions.each do |question|
    json.set! question.id do
      json.id question.id
      json.name question.name
    end
  end
end
