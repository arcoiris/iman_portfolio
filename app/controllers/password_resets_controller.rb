class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	user.send_password_reset if user
  	redirect_to root_url, notice: "Email sent with password instructions."
  end

  def edit 
  	@user = User.find_by_password_reset_token!(params[:id])
  end
  
	def update
	  @user = User.find_by_password_reset_token!(params[:id])
	  safe_password = params.require(:user).permit(:password, :password_confirmation)
	  if @user.password_reset_sent_at < 2.hours.ago
	  	redirect_to new_password_reset_path, alert: "Password reset token is expired. Send a new email."
	  elsif @user.update safe_password
	  	flash[:notice] = "Your password has now been reset!"
	  	redirect_to admin_path
	  else 
	  	render :edit 
	  end
	end
end

