require 'httparty'
module IndeedAPI
  include HTTParty
  base_uri 'http://api.indeed.com/ads/apisearch?'

  def search
      @client = Indeed::Client.new "YOUR_PUBLISHER_NUMBER"
      @params = {
          :q => 'ruby',
          :l => 'austin',
          :userip => '1.2.3.4',
          :useragent => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2)',
      }
  end

end
