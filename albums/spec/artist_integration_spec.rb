require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('artist') do
  describe("hmm", :type => :feature) do
    before() do
      Artist.clear()
      Album.clear()
    end
    it "it allows you to add an artist" do
      visit('/artists')
      fill_in('artist', :with => 'Apple')
      click_button('Add')
      expect(page).to have_content('Apple')
    end
    it "it allows you to add an artist" do
      visit('/artists')
      fill_in('artist', :with => 'Apple')
      click_button('Add')
      click_on('Apple')
      expect(page).to(have_content('Apple'))
    end
  end
end
