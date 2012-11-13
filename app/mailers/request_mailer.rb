class RequestMailer < ActionMailer::Base
  default from: "sucks.berkeley@gmail.com"
  
  def send_request(name, email, pid, iid)
    @name = name
    @email = email
    @pid = pid
    @iid = iid
    mail(:to => "sucks.berkeley@gmail.com", :subject => "We have another dev request")
  end
end
