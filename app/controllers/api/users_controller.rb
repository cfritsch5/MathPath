class Api::UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		@user.lesson_id = 2
		@user.unit_id = 2

		if @user.save
			login(@user)
			render "api/users/show"
		else
			render json: @user.errors.full_messages, status: 422
		end
	end

	# def update
	# 		@user = current_user
	# 		lesson_id = params[:user][:lesson_id].to_i
	#
	# 		@user.lesson_id =  lesson_id + 1
	#
	# 		if Lesson.find(lesson_id).unit_id != Lesson.find( @user.lesson_id ).unit_id
	# 			@user.unit_id = @user.unit_id + 1
	# 		end
	#
	# 		if @user.save
	# 			render "api/users/update"
	# 		else
	# 			render json: @user.errors.full_messages, status: 422
	# 		end
	# 	end

	def update
			@user = current_user
			lesson_id = params[:user][:lesson_id].to_i
			puts "UPDATE!!!!!!!!!!!!!!!!!!"
			puts lesson_id
			if @user.lesson_id == lesson_id

				@user.lesson_id = lesson_id + 1

				if @user.lesson_id == Lesson.last.id + 1
					puts "TRUEEEEEEEEEEEE"
					@user.unit_id = @user.unit_id + 1
				elsif Lesson.find(lesson_id).unit_id != Lesson.find( @user.lesson_id ).unit_id
					@user.unit_id = @user.unit_id + 1
				end

				if @user.save
					render "api/users/update"
				else
					render json: @user.errors.full_messages, status: 422
				end

			else
				render "api/users/update"
			end
		end

	private

	def user_params
		params.require(:user).permit(:username, :password, :lesson_id)
	end

end
