require "spec_helper"

describe AddPictureRequestMailer do
  describe '.send_request' do
    let(:url)  { 'http://fitchbitch.org/pee_en_gee.png' }
    let(:mail) { AddPictureRequestMailer.add_picture_request url }

    it 'sends the request to dave' do
      expect(mail.to).to eq ['dave.jachimiak@gmail.com']
    end

    it 'sends the request from dave' do
      expect(mail.from).to eq ['dave.jachimiak@gmail.com']
    end

    it 'sends the request from dave' do
      expect(mail.subject).to eq 'request for fitch slap'
    end
  end
end
