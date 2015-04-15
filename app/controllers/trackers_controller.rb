class TrackersController < ApplicationController
  def create
    @tracker = Tracker.new(tracker_params)
    @tracker.job_id = params[:job_id]
    if @tracker.save
      flash[:notice] = "Tracking saved"
      redirect_to job_path(params[:job_id])
    else
      flash[:notice] = @tracker.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    @tracker = Tracker.find(params[:id])
    @tracker.update(tracker_params)
    if @tracker.save
      flash[:notice] = "Tracking updated"
      redirect_to job_path(params[:job_id])
    else
      flash[:notice] = @tracker.errors.full_messages.join(", ")
      render :new
    end
  end

  protected

  def tracker_params
    params.require(:tracker).permit(
      :applied,
      :followup,
      :interviewed,
      :notes
      )
  end
end
