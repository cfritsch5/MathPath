json.id @unit.id
json.name @unit.name
json.set! "lessons" do
  @unit.lessons.each do |lesson|
    json.set! lesson.id do
      json.id lesson.id
      json.name lesson.name
    end
  end
end
