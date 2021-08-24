users = [
  {
    email: 'user@example.com',
    password: 'password',
    role: 'user'
  },
  {
    email: 'admin@example.com',
    password: 'password',
    role: 'admin'
  }
]

users.each do |params|
  User.where(email: params[:email]).first_or_create do |user|
    user.password = params[:password]
    user.role = params[:role]
  end
end