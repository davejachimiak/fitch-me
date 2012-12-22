require "spec_helper"

describe AddPictureRequestMailer do
  describe '.send_request' do
    let(:url)  { 'http://fitchbitch.org/pee_en_gee.png' }
    let(:mail) { AddPictureRequestMailer.send_request url }

    it 'sends the request to dave' do
      expect(mail.to).to eq 'dave.jachimiak@gmail.com'
    end
  end
end
