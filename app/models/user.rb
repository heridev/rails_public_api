class User < ActiveRecord::Base

  has_many :kindle_requests

  # User::Roles
  # The available roles
  Roles = [ :admin , :requester ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def self.find_or_create(user_details, token)
    email = user_details['email']

    if user = User.where(email: email).first
      user.update_attributes(token: token)
      return user
    else
      User.create!({
        email: email,
        name: user_details['name'],
        picture: user_details['picture'],
        google_id: user_details['id'],
        role: 'requester',
        token: token
      })
    end
  end

  def self.destroy_session(token)
    user = User.where(token: token).first
    user.update_attributes(token: '') if user
    return user
  end
end
