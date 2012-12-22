require 'spec_helper'

describe PicturesController do
  let(:url)     { 'www.fancy.org' }
  let(:picture) { Picture.find_by_url url }

  before do
    DatAuth.stubs(:dat_token).returns 'dat secret token'
  end

  describe '#create' do
    it 'creates a picture data object with good token' do
      post :create, url: url, token: 'dat secret token'

      expect(response).to be_success
      expect(picture.url).to eq url
    end

    it 'is secure' do
      post :create, url: url, token: 'THA CLUB'

      expect(response.response_code).to eq 401
      expect(picture).to be_nil
    end
  end
end
