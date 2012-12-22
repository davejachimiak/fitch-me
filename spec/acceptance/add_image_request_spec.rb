require 'acceptance/acceptance_helper'

feature 'add image request', %{
  As a maintainer of a random image generator
  I want to ensure that no nsfw images end up in the db
  So that all can enjoy images of Brian Fitch
} do

  scenario 'send a valid request' do
    visit '/'

    page.should have_content 'Fitch Slap'
    page.should have_content 'request an image to be added to the generator'

    fill_in 'url', with: 'http://www.images.com/bfitch420'
    click_button 'request'

    ['accept', 'reject', 'http://www.images.com/bfitch420'].each do |text|
      ActionMailer::Base.deliveries.last.body.should include text
    end
    ActionMailer::Base.deliveries.last.to.should eq 'dave.jachimiak@gmail.com'
    page.should have_content 'Request sent.'

    click_link 'make another request'

    page.should have_content 'request an image to be added to the generator'
  end
end
