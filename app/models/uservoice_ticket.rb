require 'uservoice-ruby'
require 'json'

class Uservoice_ticket < ActiveRecord::Base
  attr_accessible :body, :subject,:ticket_number, :uservoice_id, :url, :uservoice_auther_karma

  def self.poll_uservoice
    client = UserVoice::Client.new(GlobalConstants::UV_SUBDOMAIN, GlobalConstants::UV_API_KEY, GlobalConstants::UV_API_SECRET, :callback => GlobalConstants::CALLBACK_URL)
    dateAndTime = Daterecord.find_by_name('UservoiceDate')
    if not dateAndTime
      dateAndTime = Daterecord.new
      dateAndTime.name = 'UservoiceDate'
      #dateAndTime.dt = Time.now.strftime("%Y-%m-%d %H:%M:%S")
      dateAndTime.dt = "2000-01-01 00:00:00"
      dateAndTime.save
    end
    client.login_as_owner do |owner|
      response = owner.get_collection("/api/v1/tickets.json?filter=updated_after&updated_after_date=#{dateAndTime.dt.strftime("%Y-%m-%d%H:%M:%S")}-0000")
      response.each do |ticket|
        if DateTime.parse(ticket['updated_at']) > dateAndTime.dt
          uv_ticket = Uservoice_ticket.new
          messages = ticket['messages']
          message = messages[0]
          if message
          	uv_ticket.body = message['body']
          end
          uv_ticket.subject = ticket['subject']
          uv_ticket.uservoice_id = ticket['id']
          uv_ticket.ticket_number = ticket['ticket_number']
          uv_ticket.url = ticket['url']
		  rspec_helper = Daterecord.find_by_id(1)
          uv_ticket.save
        end
      end
      dateAndTime.dt = Time.now.strftime("%Y-%m-%d %H:%M:%S")
      dateAndTime.save
    end
    
  end
end




