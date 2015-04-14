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
      save_and_open_page
      expect(page).to have_content("Tracking saved")
    end
  end
end
