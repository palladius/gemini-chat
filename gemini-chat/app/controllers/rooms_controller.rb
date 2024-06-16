class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create(name: params["room"]["name"])
  end

  def index
    @current_user = current_user # rescue nil
    unless @current_user
      redirect_to '/pages/no_auth' # unless @current_user
      #return anonym_index
    end
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
  end

  def show
    # TODO redirect to inex if doesnt exist
    @current_user = current_user
    @single_room = Room.find(params[:id]) rescue nil
    #redirect_to '/rooms#index' unless @single_room
    @rooms = Room.public_rooms.order(:name)
    @users = User.all_except(@current_user).order(:username)
    @messages = @single_room.messages
    # lets initialize new stuff
    @room = Room.new
    @message = Message.new

    render "index"
  end

end
