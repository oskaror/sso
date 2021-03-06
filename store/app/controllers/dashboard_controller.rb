# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @current_user = Session.from_token(cookies[:session])&.user
  end
end
