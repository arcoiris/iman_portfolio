class StaticContentsController < ApplicationController
	before_action :authorize, only: [:edit, :update, :create, :new, :destroy]

  def edit
  	@static_content = STATIC_CONTENT
  end

  def update
  	@static_content = STATIC_CONTENT
  	safe_static_content = params.require(:static_content).permit(:about, :contact_email, :contact_number, :contact_blurb)
  	@static_content.update safe_static_content
  	flash[:notice] = "The content has been successfully updated!"
  	redirect_to users_dashboard_path
  end

  def contact
    @contact_blurb = STATIC_CONTENT.contact_blurb
    @contact_email = STATIC_CONTENT.contact_email
    @contact_number = STATIC_CONTENT.contact_number
    @photos = Photo.all
  end
end
