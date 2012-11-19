require 'uservoice-ruby'
require 'json'
require 'mechanize'

class Uservoice_ticket < ActiveRecord::Base
  attr_accessible :body, :subject,:ticket_number, :uservoice_id, :url, :uservoice_auther_karma

  def self.poll_uservoice
    client = UserVoice::Client.new('google5', 'NsOgv6KCGyHQaOhSghlow', '88OahJ68hkjHpcIYncmqgEAW88RszQMjT4zQmtng', :callback => 'http://localhost:3000/')
    client.login_as_owner do |owner|
      response = owner.get_collection("/api/v1/tickets.json")
      response.each do |ticket|
        uv_ticket = Uservoice_ticket.new
        uv_ticket.body = ticket['body']
        uv_ticket.subject = ticket['subject']
        uv_ticket.uservoice_id = ticket['id']
        uv_ticket.ticket_number = ticket['ticket_number']
        uv_ticket.url = ticket['url']
        uv_ticket.save
      end
    end
    
  end
end