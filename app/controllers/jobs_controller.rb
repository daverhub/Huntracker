class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create]
  def index
    if params[:job].present?
      job = IndeedAPI.get_job(params[:job])
      current_user.jobs.new.save_data_from_indeed(job)
      redirect_to :back
    else
      @jobs = current_user.jobs
      @jobs= Kaminari.paginate_array(@jobs).page(params[:page]).per(10)
    end

  end

  def show
    @job = Job.find(params[:id])
    if @job.tracker
      @tracker = @job.tracker
    else
      @tracker = Tracker.new
    end
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

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Job updated"
      redirect_to @job
    else
      flash[:alert] = @job.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @job = Job.where(job_key: params[:id])
    if @job.first.destroy
      flash[:notice] = 'Job successfully removed'
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to jobs_path
  end

  protected
  def job_params
    params.require(:job).permit(
        :title, :company, :url, :city, :state, :country, :description
    )
  end
end
