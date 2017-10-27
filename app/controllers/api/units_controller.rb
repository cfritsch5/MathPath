class Api::UnitsController < ApplicationController

  def index
    @units = Unit.all
    @lessons = Lesson.all
    if current_user
      @user = current_user
    else
      @user = {lesson_id: 2, unit_id:2}
    end
  end

  def show
    @unit = Unit.find(params[:id])
  end
end
