class UsersController < ApplicationController
  before_action :authorize
  
  def index
  end

  def new
    @user = User.new 
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
