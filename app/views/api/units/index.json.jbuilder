json.set! "units" do
  json.array! @units, :id, :name
end
json.set! "progress" do
  #stuff
  json.maxUnit @units.count
  json.maxLesson @lessons.count
  json.lessonId @user.lesson_id
  json.unitId @user.unit_id
end
