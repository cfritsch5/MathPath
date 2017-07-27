class Api::UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		@user.lesson_id = 1
		@user.unit_id = 1

		if @user.save
			login(@user)
			render "api/users/show"
		else
			render json: @user.errors.full_messages, status: 422
		end
	end

	def update
			@user = current_user
			lesson_id = params[:user][:lesson_id].to_i

			@user.lesson_id =  lesson_id + 1

			if Lesson.find(lesson_id).unit_id != Lesson.find( @user.lesson_id ).unit_id
				@user.unit_id = @user.unit_id + 1
			end

			if @user.save
				render "api/users/update"
			else
				render json: @user.errors.full_messages, status: 422
			end
		end

	private

	def user_params
		params.require(:user).permit(:username, :password, :lesson_id)
	end

end
