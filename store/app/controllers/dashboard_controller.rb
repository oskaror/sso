class DashboardController < ApplicationController
  def index
    @current_user = Session.from_token(cookies[:session])
  end
end