require 'net/https'

class SmsGate
  class << self
    attr_accessor :sent
    def send msg, telephone
      (self.sent ||= []) << {:message => msg, :telephone => telephone } and return if 
        ENV['RAILS_ENV'] == 'test'
      send_request "https://smsc.ru/sys/send.php?login=xxx&translit=1&psw=xxx&phones=#{telephone}&mes=#{CGI::escape msg}&sender=#{URI.escape "Gorodok"}"
    end
    def get_price msg, telephone
      send_request("https://smsc.ru/sys/send.php?login=xxx&psw=xxx&phones=#{telephone}&mes=#{CGI::escape msg}&cost=1").body
    end

    private

    def send_request url
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      raise response.body if response.body =~ /ERROR*/ || response.code != "200"
      response
    end
  end
end
