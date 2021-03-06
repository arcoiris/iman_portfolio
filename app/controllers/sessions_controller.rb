class SessionsController < ApplicationController

	def new
		if current_user
			redirect_to root_path, alert: "You must sign out first."
		end
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to rails_admin.dashboard_path
		else
			@flash = flash.now[:error] = "Invalid email/password combination"	
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Logged out"
	end
end
