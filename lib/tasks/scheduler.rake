desc "This task is called by the Heroku scheduler add-on"
task :poll_uservoice => :environment do
  Uservoice_ticket.poll_uservoice
end