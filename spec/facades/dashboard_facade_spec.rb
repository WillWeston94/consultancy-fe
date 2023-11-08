require 'rails_helper'

RSpec.describe DashboardFacade do
  it "exists", :vcr do
    user_id = 1
    facade = DashboardFacade.new(user_id)

    expect(facade).to be_a DashboardFacade
    expect(facade.recipes).to be_an Array
  end
end