class SearchesController < ApplicationController
  def index
    if params[:q].present?
      @jobs = IndeedAPI.search_jobs(q: params[:q], l: params[:l])
      @results =[]
      if @jobs.total_results > 25
        start = 1
        10.times do
          IndeedAPI.search_jobs(q: params[:q], l: params[:l], start: start).results. each do |result|
            @results << result
            start +=25
          end
        end
      end
    else
      @jobs =[]
      @results = []
    end
    @results = Kaminari.paginate_array(@results).page(params[:page]).per(10)
  end

  protected
  def search_params
    params.require(:indeed).permit(:q, :l)
  end
end
