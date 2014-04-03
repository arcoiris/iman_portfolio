class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# user is signed in, redirect to cms dashboard
		else
			flash.now[:error] = "Invalid email/password combination"	
			render 'new'
	end

	def destroy
	end
end
