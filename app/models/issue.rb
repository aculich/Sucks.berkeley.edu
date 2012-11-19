require 'pivotal-tracker'
require 'uservoice-ruby'
require 'oauth'

class Issue < ActiveRecord::Base
  # attr_accessible :action, :date_entered, :goal, :name, :identity_tags
  has_many :comments
  belongs_to :project
  attr_accessible :name, :link_to_uservoice, :date_entered, :votes, :action, :as_a, :so_that, :i_want, :project_id
'''
  def self.symbolize_hash(hash)
    symbolized_hash = {}
    puts hash.inspect
  
    hash.each do |key, value|
      symbolized_hash[key.to_sym] = value
    end
    return symbolized_hash
  end
  
  SUBDOMAIN_NAME = "google5"
  API_KEY = "NsOgv6KCGyHQaOhSghlow"
  API_SECRET = "88OahJ68hkjHpcIYncmqgEAW88RszQMjT4zQmtng"
  URL = "http://localhost:3000/"
  SITE = "http://google5.uservoice.com"
  client = UserVoice::Client.new(SUBDOMAIN_NAME, API_KEY, API_SECRET, :callback => URL)
  
  #suggestions = client.get("#{SITE}/api/v1/forums/1/suggestions.json")

  client.login_as_owner do |owner|
    debugger
    response = owner.get("#{SITE}/api/v1/tickets.json")
  end
'''
'''
  consumer = OAuth::Consumer.new(API_KEY, API_SECRET)

  puts "Get request token"
  response = consumer.request(:get, "#{SITE}/api/v1/oauth/request_token.json")
  request_token_hash = JSON.parse(response.body)
  puts request_token_hash

  request_token = OAuth::RequestToken.from_hash(consumer,
     symbolize_hash(request_token_hash["token"]))

  # this is just a library we use to create SSO tokens, similar code
  # snippets can be found under the SSO docs here
  encoder = Sso::Schemes::AesCbc128::Base64Encoder.new(SUBDOMAIN_NAME, API_KEY)

  # create the SSO token setting the user to be an admin so
  # we can list the tickets back later
  sso_token = encoder.process({
    :guid => "test@test.com",
    :expires => "2012-12-31",
    :email => "test@test.com",
    :avatar_url => "http://external.com/users/1.png",
    :display_name => "Testie McTest",
    :admin => "accept"
  })

  # get the access token for this new user
  response = consumer.request(:post, "#{SITE}/api/v1/oauth/authorize.json", nil, {}, {
    :sso => sso_token, :request_token => request_token_hash["token"]["oauth_token"]
  })
  user_hash = JSON.parse(response.body)
  access_token = OAuth::AccessToken.from_hash(consumer, symbolize_hash(user_hash["token"]))

  # create the params for the ticket
  ticket = {
    "ticket[message]" => "Everything is broken......",
    "ticket[subject]" => "Help!!!"
  }

  # create a ticket
  response = access_token.request(:post, "#{SITE}/api/v1/tickets.json", ticket)
  body = JSON.parse(response.body)

  # get our ticket
  response = access_token.request(:get, "#{SITE}/api/v1/tickets.json?per_page=1")
  body = JSON.parse(response.body)

  puts body["tickets"][0].inspect
  '''
  # has_many :identity_tags
  # TODO make has_many with identity_tags, but we actually have to make the class
end
