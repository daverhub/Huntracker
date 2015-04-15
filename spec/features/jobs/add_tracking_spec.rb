require 'rails_helper'

feature "add notes to a saved Job" do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'successfull add notes to job' do
      job = FactoryGirl.create(:job)

      visit job_path(job)
      fill_in "Notes", with: "will apply by tommorrow"
      click_on "Save"

      expect(page).to have_content("Tracking saved")
    end
    scenario 'successfull update notes to job' do
      job = FactoryGirl.create(:job)

      visit job_path(job)
      fill_in "Notes", with: "will apply by tommorrow"
      click_on "Save"
      fill_in "Notes", with: "write coverletter"
      click_on "update"
      expect(page).to have_content("Tracking updated")
    end
  end
end
