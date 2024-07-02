class MonthsController < ApplicationController
  def index
    @months = Month.all.order(id: :desc)
  end

  def show
    @month = Month.find(params[:id])
  end
end

