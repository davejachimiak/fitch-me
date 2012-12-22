class AddPictureRequestMailer < ActionMailer::Base
  default from: "from@example.com", to: 'dave.jachimiak@gmail.com'

  def add_picture_request url
    @url = url
    @token = DatAuth.dat_token
    mail
  end
end
