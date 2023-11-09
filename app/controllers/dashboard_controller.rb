class DashboardController < ApplicationController
  def index
    if current_user
      @facade = DashboardFacade.new(current_user.id)
    else
      flash[:error] = "Please log in to view your dashboard!"
      redirect_to root_path
    end
  end
end