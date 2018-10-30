# Uses: Sentences section on this page https://developer.oxforddictionaries.com/documentation
#
# ```
# As a guest user (no sign in required)
# When I visit "/"
# And I fill in a text box with "mindfulness"
# And I click "Submit"
# Then I should see a message that says "Examples for using 'mindfulness'"
# And I should see a list of sentences with examples of how to use the word
# And I should see only sentences where the region for usage is "British" or "Canadian"
# And I should not see sentences for any other regions (or blank regions)
# ```
require 'rails_helper'

feature 'Guest user submitting a word' do
  scenario 'displays a list of example sentances for that word' do
    word_id = "mindfulness"
    visit "/"
    fill_in :q, with: "mindfulness"
    click_on "Search"
    expect(page).to have_content("Examples for using 'mindfulness'")
    expect(current_url).to include("/entries/en/#{word_id}/sentences")
    expect(page).to have_css(".sentance")
  end
end
