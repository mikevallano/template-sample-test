class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event.starts_at = @event.starts_at.to_s
    @event.ends_at = @event.ends_at.to_s
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    # event_params2 = event_params
    # event_params2[:starts_at] = date_from_string(event_params2[:starts_at])
    # event_params2[:ends_at] = date_from_string(event_params2[:ends_at])
    # @event = Event.new(event_params2)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.starts_at != event_params[:starts_at] || @event.ends_at != event_params[:ends_at]
        event_params2 = event_params
        event_params2[:starts_at] = date_from_string(event_params2[:starts_at])
        event_params2[:ends_at] = date_from_string(event_params2[:ends_at])
      else
        event_params2 = event_params
        event_params2[:starts_at] = event_params[:starts_at]
        event_params2[:ends_at] = event_params[:ends_at]
      end
      if @event.update(event_params2)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :gatito_id, :starts_at, :ends_at)
    end
end
