class Api::UnitsController < ApplicationController

  def index
    @units = Unit.all
    puts "current user !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    p current_user
    if current_user
      @user = current_user
    else
      @user = {lesson_id: 1, unit_id:1}
    end
  end

  def show
    @unit = Unit.find(params[:id])
  end
end
