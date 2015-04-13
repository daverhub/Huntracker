class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    if params[:job].present?
      job = IndeedAPI.get_job(params[:job])
      current_user.jobs.new.save_data_from_indeed(job)
      redirect_to :back
    else
      @jobs = current_user.jobs
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
      @job = current_user.jobs.new(job_params)
      @job.job_key = @job.title
      if @job.save
        flash[:notice] = "New Job Added"
        @job.job_key = @job.id

        redirect_to @job
      else
        flash[:notice] = @job.errors.full_messages.join(", ")
        render :new
      end

  end

  protected
  def job_params
    params.require(:job).permit(
        :title, :company, :url, :city, :state, :country, :description
    )
  end
end
