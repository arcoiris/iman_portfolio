class HomeController < ApplicationController

  def index
  	@about = STATIC_CONTENT.about
  end
end