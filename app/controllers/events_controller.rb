class EventsController < ApplicationController
  
  def index
    @events= Event.all
  end

  def new
    @event=Event.new
  end

  def show
    @event=Event.find(params[:id])
  end

  def create
    @event=Event.new(eventparams)
    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
  end
end

  private
  def eventparams
    params.require(:event).permit(:eventname, :date, :user_id)
  end
end
