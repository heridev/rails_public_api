class User < ActiveRecord::Base

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
