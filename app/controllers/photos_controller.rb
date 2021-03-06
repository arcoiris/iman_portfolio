class PhotosController < ApplicationController
	before_action :authorize, only: [:new, :show, :create, :update, :destroy]

	def show
		@photo = Photo.find params[:id]
	end

	def new
		@photo = Photo.new
	end

	def create
		safe_photo = params.require(:photo).permit(:photo, :caption, :photographer, :photo_type)
		@photo = Photo.create safe_photo
		@photo.save ? redirect_to(@photo) : render("new")
	end

	def update
		@photo = Photo.find params[:id]
		safe_photo = params.require(:photo).permit(:photo, :caption, :photographer, :photo_type)
		@photo.update safe_photo
		@photo.save ? redirect_to(@photo) : render("update")
	end

	def destroy
		@listing.destroy
		flash[:alert] = "Successfully deleted photo!"
	end

	def editorial
		@photos = Photo.editorial.order(created_at: :desc)
	end

	def runway
		@photos = Photo.runway.order(created_at: :desc)
	end
end
