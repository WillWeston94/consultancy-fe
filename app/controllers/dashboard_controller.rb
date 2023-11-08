class DashboardController < ApplicationController
  def index
    @facade = DashboardFacade.new(current_user.id)
  end
end