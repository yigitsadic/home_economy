class RecurringEventsController < ApplicationController
  before_action :set_recurring_event, only: %i[show edit update destroy]
  
  def index
    @recurring_events = RecurringEvent.order(created_at: :asc)
  end

  def new
    @recurring_event = RecurringEvent.new
  end

  def create
    @recurring_event = RecurringEvent.new(recurring_event_params)
    
    if @recurring_event.save
      redirect_to recurring_event_url(@recurring_event), notice: "Recurring event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recurring_event.update(recurring_event_params)
      redirect_to recurring_event_url(@recurring_event), notice: "Recurring event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recurring_event.destroy!

    redirect_to recurring_events_url, notice: "Recurring event was successfully destroyed."
  end

  private

  def set_recurring_event
    @recurring_event = RecurringEvent.find(params[:id])
  end
  
  def recurring_event_params
    params.require(:recurring_event).permit(:name, :category, :day_of_month, :financial_value)
  end
end

