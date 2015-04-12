class JobsController < ApplicationController
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
    @job = Job.save_data_from_indeed(params[:job])
    @job = current_user.jobs.new(job_params)
    if @job.save
      flash[:notice] = "New Job Added"
      redirect_to @job
    else
      flash[:notice] = @job.errors.full_messages.join(", ")
      render :new
    end
  end

  def add_api_job
    save_data_from_indeed
  end

  protected
  def job_params
    params.require(:job).permit(
        :title, :company, :url, :city, :state, :country, :description
    )
  end
end
