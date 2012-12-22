require 'spec_helper'

describe RandomController do
  describe '#show' do
    before do
      5.times do
        FactoryGirl.create :picture
      end
    end

    it 'fetches a random picture url' do
      get :show
      expect(resonse).to be_success

      urls = Picture.all.select :url
      expect(urls).to include response.body
    end
  end
end
