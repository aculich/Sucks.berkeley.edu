require 'uservoice-ruby'
require 'json'

class Uservoice_ticket < ActiveRecord::Base
  attr_accessible :body, :subject, :uservoice_id, :uservoice_auther_karma
  @KEY = 'CLIENT_KEY'
  @SECRET = 'CLIENT_SECRET'
  @SITE = 'http://your_subdomain.uservoice.com'
  @LAST_POLL_DATE = Date.
  
  

  
  
  def poll_uservoice
    consumer = OAuth::Consumer.new(KEY, SECRET)
    response = consumer.request(:get, "#{SITE}/api/v1/oauth/request_token.json") 
    request_token_hash = JSON.parse(response.body)
    
    response = consumer.request(:post, "#{SITE}/api/v1/oauth/authorize.json", nil, {}, {
      :sso => sso_token, :request_token => request_token_hash["token"]["oauth_token"]})
    user_hash = JSON.parse(response.body)
    
    access_token = OAuth::AccessToken.from_hash(consumer, symbolize_hash(user_hash["token"]))
    
    response = access_token.request(:get, "#{SITE}/api/v1/tickets.json?per_page=100&page=1&filter=updated_after&updated_after_date=LAST_POLL_DATE")
    body = JSON.parse(response.body)
    total_records = body["total_records"]
    
  end
  
  
  
  #helper method
  def symbolize_hash(hash)
    symbolized_hash = {}
    hash.each do |key, value|
      symbolized_hash[key.to_sym] = value
    end
    return symbolized_hash
  end
end