require 'acceptance/acceptance_helper'

feature 'add image request', %{
  As a maintainer of a random image generator
  I want to ensure that no nsfw images end up in the db
  So that all can enjoy images of Brian Fitch
} do
  let(:accept_link) { '<a href="http://fitchslap.heroku.com/pictures?token=dat+phat+token&amp;url=http%3A%2F%2Fwww.images.com%2Fbfitch420">accept</a>' }

  background do
    DatAuth.stubs(:dat_token).returns 'dat phat token'
  end

  scenario 'send a valid request' do
    visit '/'

    page.should have_content 'Fitch Slap'
    page.should have_content 'request an image to be added to the generator'

    fill_in 'url', with: 'http://www.images.com/bfitch420'
    click_button 'request'

    [accept_link].each do |text|
      ActionMailer::Base.deliveries.last.body.encoded.should include text
    end
    [:from, :to].each do |attr|
      ActionMailer::Base.deliveries.last.send(attr).should eq 'dave.jachimiak@gmail.com'
    end
    page.should have_content 'Request sent.'

    click_link 'make another request'

    page.should have_content 'request an image to be added to the generator'
  end
end
