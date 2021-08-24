class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      cookies[:session] = Session.new(user).generate_token
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    cookies.delete(:session)
    redirect_to root_url
  end
end