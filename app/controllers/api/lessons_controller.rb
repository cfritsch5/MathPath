class Api::LessonsController < ApplicationController
  # def index
  #   p "I am from the lessons controller"
  #   p params
  #   p "I am from the lessons controller"
  #   @lessons = Lesson.where(unit_id: params[:id])
  # end

  def show
    @lesson = Lesson.find(params[:id])
    #@questions = Questions.find_by(lesson_id: params[:id])
  end
end
