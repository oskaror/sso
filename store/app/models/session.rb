# frozen_string_literal: true

class Session
  SECRET_KEY = ENV['JWT_SECRET']

  attr_reader :user

  def self.from_token(token)
    payload, _header = JWT.decode(token, SECRET_KEY)
    user = User.find_by(email: payload['email'])
    new(user) if user
  rescue JWT::DecodeError
    nil
  end

  def initialize(user)
    @user = user
  end

  def generate_token
    JWT.encode({
                 exp: 1.day.from_now.to_i,
                 email: @user.email,
                 role: @user.role
               }, SECRET_KEY)
  end
end
