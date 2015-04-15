require 'rails_helper'

feature "paginating API search" do
  scenario "user visits index and searches for job" do
    visit searches_path

    fill_in :q, with: "software engineer"
    click_on "Find Jobs"

    expect(page).to have_link("Next")
  end

  scenario "user clicks next to see additional search results" do
    visit searches_path

    fill_in :q, with: "software engineer"
    click_on "Find Jobs"

    click_on 'Next'

    expect(page).to have_link("Prev")
  end
end
