class Api::UsersController < ApplicationController

	def create
		@user = User.new(user_params)

		if @user.save
			login(@user)
			render "api/users/show"
		else
			render json: @user.errors.full_messages, status: 422
		end
	end

	def update
		if current_user

			@user = current_user
			@user.lesson_id = params[:user][:lesson_id]
			@user.unit_id = params[:user][:unit_id]

			if @user.save
				render "api/users/update"
			else
				render json: @user.errors.full_messages, status: 422
			end

		else
			render json: @user.errors.full_messages, status: 422 #not sure about status here
		end

	private

	def user_params
		params.require(:user).permit(:username, :password, :lesson_id, :unit_id)
	end

end
