require 'rails_helper'

feature "updating an job" do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end
    scenario "update page correctly populates information" do
      job = FactoryGirl.create(:job,
        title: 'software engineer',
        description: 'greatest job description text',
        user: user
      )
      visit job_path(job)

      click_on "Edit Job"

      expect(find_field('Title').value).to eq('software engineer')
      expect(find_field('Description').value).to eq('greatest job description text')
    end

    scenario "succesfully update job information" do
      job = FactoryGirl.create(:job, user: user)
      visit job_path(job)

      click_on "Edit Job"
      fill_in "Title:", with: "Rails developer"
      fill_in "Description", with: "create awesome things"

      click_on "Update Job"

      expect(page).to have_content("Job updated")
      expect(page).to have_content("Rails developer")
      expect(page).to have_content("create awesome things")
    end

    scenario "fails to update with empty name" do
      job = FactoryGirl.create(:job, user: user)
      visit job_path(job)

      click_on "Edit Job"
      fill_in "Title:", with: ""
      click_on "Update Job"

      expect(page).to have_content("Title can't be blank")
    end
  end
end
