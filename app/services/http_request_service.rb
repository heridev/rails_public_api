require 'net/http'

class HttpRequestService

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def create_request(token)
    begin
      final_url = URI.parse("#{@url}#{token}")
      result = JSON.parse(http_request(final_url).body)
    rescue => exc
      Rails.logger.error exc
    end

    result
  end

  private

  def http_request(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Get.new(url.request_uri)
    response = http.request(request)
    return response
  end
end

