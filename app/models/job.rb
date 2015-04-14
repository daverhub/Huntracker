class Job < ActiveRecord::Base
  validates :title, presence: true
  validates :company, presence: true
  validates :user, presence: true
  validates :job_key, uniqueness: true
  belongs_to :user
  has_one :tracker

  def save_data_from_indeed(job)
    self.title = job.job_title
    self.company = job.company
    self.city = job.city
    self.state = job.state
    self.country = job.country
    self.description = job.snippet
    self.url = job.url
    self.job_key = job.job_key
    self.save
  end
end
