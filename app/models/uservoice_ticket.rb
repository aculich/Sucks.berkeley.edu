require 'uservoice-ruby'
require 'json'
require 'mechanize'

class Uservoice_ticket < ActiveRecord::Base
  attr_accessible :body, :subject, :uservoice_id, :uservoice_auther_karma
  @API_KEY = 'NsOgv6KCGyHQaOhSghlow'
  @API_SECRET = '88OahJ68hkjHpcIYncmqgEAW88RszQMjT4zQmtng'
  @SUBDOMAIN_NAME = 'google5'
  @CALLBACK_URL = 'https://localhost:3000'
  @SITE = 'http://google5.uservoice.com'
  
  

  
  
  def self.poll_uservoice
    client = UserVoice::Client.new('google5', 'NsOgv6KCGyHQaOhSghlow', '88OahJ68hkjHpcIYncmqgEAW88RszQMjT4zQmtng', :callback => 'http://localhost:3000/')
    client.login_as_owner do |owner|
      response = owner.get_collection("/api/v1/tickets.json")
      response.each do |ticket|
        uv_ticket = Uservoice_ticket.new
        uv_ticket.body = ticket['body']
        uv_ticket.subject = ticket['subject']
        uv_ticket.uservoice_id = ticket['id']
        uv_ticket.save
      end
    end
    
  end


  def symbolize_hash(hash)
    symbolized_hash = {}
    # puts hash.inspect
    hash.each do |key, value|
      symbolized_hash[key.to_sym] = value
    end
    return symbolized_hash
  end
end