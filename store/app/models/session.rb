class Session
  SECRET_KEY = ENV['JWT_SECRET'].freeze

  def self.from_token(token)
    payload, _header = JWT.decode(token, SECRET_KEY)
    User.find_by(email: payload['email'])
  rescue JWT::DecodeError
    nil
  end

  def initialize(user)
    @user = user
  end

  def generate_token
    JWT.encode({
                 type: :session,
                 exp: 1.day.from_now.to_i,
                 email: @user.email,
                 role: @user.role
               }, SECRET_KEY)
  end
end