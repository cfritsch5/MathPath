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
    end
  end
end
