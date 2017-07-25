class Lesson < ApplicationRecord
  validates :name, :unit_id, presence: true

  belongs_to :unit
  has_many :questions

  def self.find_by_unit(unit_id)
    @lessons = Lesson.find_by(unit_id: unit_id)
  end
end
