require 'rails_helper'

feature "adding job to watch list from API" do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'successfully adds job' do
      visit root_path

      fill_in "what:", with: "software engineer"
      click_on "Find Jobs"
      click_on "Add job"

      expect(page).to have_content("Remove Job")
    end
  end
end
