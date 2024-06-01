class RoomsController < ApplicationController

  def create
    @room = Room.create(name: params["room"]["name"])
  end

  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
  end
end
