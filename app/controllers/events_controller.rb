class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[show create new ]
  def index
    @events= Event.all
    # @email = @event.user.email
  end

  def new
    @event=Event.new
  end

  def show
    @event=Event.find(params[:id])
  end

  def create
    @event= current_user.events.new(eventparams)
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
