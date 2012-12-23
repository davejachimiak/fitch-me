class AddPictureRequestMailer < ActionMailer::Base
  EMAIL = 'dave.jachimiak@gmail.com'

  default to: EMAIL, from: EMAIL, subject: 'request for fitch me'

  def add_picture_request url
    @url = url
    @token = DatAuth.dat_token
    mail
  end
end
