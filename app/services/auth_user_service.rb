require 'net/http'

class AuthUserService
  USER_INFO_URL = 'https://www.googleapis.com/oauth2/v1/userinfo?access_token='

  def self.create(user_token, token_status)
    if token_status
      user_info = HttpRequestService.new(USER_INFO_URL).create_request(user_token)
      user = User.find_or_create(user_info, user_token)
    else
      user = { errors: 'invalid user token' }
    end
    user
  end
end

