# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session_token = Session.new(user).generate_token
      add_session_cookie(session_token)
    else
      params[:message] = 'Invalid Email or Password'
    end

    redirect_to root_url
  end

  def destroy
    cookies.delete(:session)
    redirect_to root_url
  end

  private

  def add_session_cookie(session_token)
    cookies[:session] = {
      value: session_token,
      http_only: true,
      domain: :all,
      tld_length: 2
    }
  end
end
