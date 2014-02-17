require 'net/http'

class AuthUserService
  USER_INFO_URL = 'https://www.googleapis.com/oauth2/v1/userinfo?access_token='

  def self.create(user_token)
    user_info = HttpRequestService.new(USER_INFO_URL).create_request(user_token)
    user = User.find_or_create(user_info, user_token) if is_valid_email_domain? user_info['email']
    user
  end

  private

  def self.is_valid_email_domain? user_email
    user_email.split('@').last == 'crowdint.com'
  end
end

