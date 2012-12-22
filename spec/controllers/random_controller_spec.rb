require 'spec_helper'

describe RandomController do
  describe '#show' do
    let(:urls) { Picture.all.map &:url }
    let(:random_url) do
      ActiveSupport::JSON.decode(response.body)['picture']['url']
    end

    before do
      5.times do
        FactoryGirl.create :picture
      end
    end

    it 'fetches a random picture url' do
      get :show
      expect(response).to be_success

      expect(urls).to include random_url
    end
  end
end
