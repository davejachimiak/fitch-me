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
      expect(response).to be_success

      urls = Picture.all.map &:url
      random_url = ActiveSupport::JSON.decode(response.body)['picture']['url']

      expect(urls).to include random_url
    end
  end
end
