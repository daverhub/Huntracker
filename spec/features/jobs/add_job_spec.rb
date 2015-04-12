require 'rails_helper'

feature "adding job to watch list" do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'successfully adds job' do
      click_on 'Add job'
      fill_in "Title", with: "software engineer"
      fill_in "Company", with: "Launch Academy"
      click_on "Submit"

      expect(page).to have_content("New Job Added")
      expect(page).to have_content("software engineer")
    end
  end
end
