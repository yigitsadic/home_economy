class DashboardController < ApplicationController
  def index
    @month = Month.get_current_month
  end
end
