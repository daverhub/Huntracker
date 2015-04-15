require 'rails_helper'

feature "Remove job from watch list" do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'successfully Remove job' do
      job = FactoryGirl.create(:job)

      visit job_path(job)
      click_link "Remove Job"

      expect(page).to_not have_link(job.title)
    end
  end
end
