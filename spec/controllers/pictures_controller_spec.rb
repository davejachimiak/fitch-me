require 'spec_helper'

describe PicturesController do
  let(:url) { 'www.fancy.org' }

  before do
    DatAuth.stubs(:dat_token).returns 'dat secret token'
  end

  describe '#create' do
    it 'creates a picture data object with good token' do
      post :create, url: url, token: 'dat secret token'

      expect(response).to be_success
      expect(Picture.last.url).to eq url
    end
  end
end
