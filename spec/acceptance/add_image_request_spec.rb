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
    press_button 'request'

    page.should have_content 'Request sent.'

    click_link 'make another request'

    page.should have_content 'request an image to be added to the generator'
  end
end
