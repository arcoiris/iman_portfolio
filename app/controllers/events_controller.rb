class EventsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :create, :new, :destroy]



  def index
  	@events = Event.all
  end
end
