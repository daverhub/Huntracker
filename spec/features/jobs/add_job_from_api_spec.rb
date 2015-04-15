require 'rails_helper'

feature "adding job to watch list from API" do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'successfully adds job' do
      visit root_path

      fill_in :q, with: "software engineer"
      click_on "Find Jobs"
      first(:link, "Add job").click

      expect(page).to have_link("Remove job")
    end
  end
  context 'as an visitor' do
    scenario 'fail to add job form API' do
      visit root_path

      fill_in :q, with: "software engineer"
      click_on "Find Jobs"
      first(:link, "Add job").click

      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end
end
