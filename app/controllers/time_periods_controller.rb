class TimePeriodsController < ApplicationController
  def index
    @time_periods = TimePeriod.all
  end

  def show
    @time_period = TimePeriod.find(params[:id])
    @time_entries = current_user.time_entries.where(
      time_period_id: @time_period.id
    ).order(:day)
  end

  def new
    @time_period = TimePeriod.new
  end

  def create
    @time_period = TimePeriod.new(time_period_params)
    if @time_period.save
      flash[:success] = t('.success')
      redirect_to time_periods_url
    else
      render 'new'
    end
  end

  def edit
    @time_period = TimePeriod.find(params[:id])
  end

  def update
    @time_period = TimePeriod.find(params[:id])
    if @time_period.update_attributes(time_period_params)
      flash[:success] = t('.success')
      redirect_to @time_period
    else
      render 'edit'
    end
  end

  def destroy
    TimePeriod.find(params[:id]).destroy
    flash[:success] = t('.success')
    redirect_to roles_url
  end

  private

  def time_period_params
    params.require(:time_period).permit(:start, :duration, :locked)
  end
end
