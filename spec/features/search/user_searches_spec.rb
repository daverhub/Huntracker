require 'rails_helper'

feature "user searches for text" do
  scenario "user searches" do
    visit root_path
    fill_in :q, with: "software engineer"
    click_button "Start Job Hunt"

    expect(page).to have_link("Add job")
  end
  scenario "user searches" do
    visit searches_path
    fill_in :q, with: "software engineer"
    click_button "Start Job Hunt"

    expect(page).to have_link("Add job")
  end
end
