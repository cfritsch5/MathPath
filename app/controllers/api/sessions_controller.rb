class Api::SessionsController < ApplicationController

	def create
		@user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
		puts "WTF !!!!!!!!!!!!!!!!!!!!"
		puts @user

		if @user && @user.username == "Guest"
			@user.lesson_id = 2
			@user.unit_id = Unit.count
			@user.save!
		end

    if @user
			login(@user)
			render "api/users/show"
		else
			render(
        json: ["Invalid username/password combination"],
        status: 401
      )
		end
	end

	def destroy
		@user = current_user
		if @user
			logout
			render "api/users/show"
		else
			render(
        json: ["Nobody signed in"],
        status: 404
      )
		end
	end

end
