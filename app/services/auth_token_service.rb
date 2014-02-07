require 'net/http'

class AuthTokenService
  VERIFICATION_URL = 'https://www.googleapis.com/oauth2/v1/tokeninfo?access_token='

  def self.verify_token(access_token, client_id)
    token_result = HttpRequestService.new(VERIFICATION_URL).create_request(access_token)
    (token_result['audience'] == client_id && true) || false
  end
end

