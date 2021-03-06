require 'rails_helper'

feature "adding job to watch list" do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'successfully adds job' do
      visit root_path
      click_on "Add Job"

      fill_in "Title", with: "software engineer"
      fill_in "Company", with: "Launch Academy"
      click_on "Save Job"


      expect(page).to have_content("New Job Added")
      expect(page).to have_content("software engineer")
    end

    scenario 'fail to add job' do
      visit new_job_path

      fill_in "Title", with: ""
      fill_in "Company", with: ""
      click_on "Save Job"

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Company can't be blank")
    end
  end
end
