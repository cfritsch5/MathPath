class Question < ApplicationRecord
  validates :title, :lesson_id, presence: true

  belongs_to :lesson

  def self.find_by_lesson(lesson_id)
    @question = Question.find_by(lesson_id: lesson_id)
  end 
end
