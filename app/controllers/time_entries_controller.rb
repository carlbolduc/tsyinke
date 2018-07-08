class TimeEntriesController < ApplicationController

  def new
    @time_entry = TimeEntry.new
    @time_period = TimePeriod.find(params[:time_period_id])
    @options = day_options(@time_period)
    respond_to do |format|
      format.js
    end
  end

  def create
    @time_period = TimePeriod.find(params[:time_period_id])
    @time_entry = current_user.time_entries.build(time_entry_params)
    @time_entry.time_period_id = @time_period.id
    if @time_entry.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def time_entry_params
    params.require(:time_entry).permit(:day, :hours, :note, :project_id, :time_period_id)
  end

  def day_options(time_period)
    options = [[Date::DAYNAMES[time_period.start.wday], time_period.start]]
    for i in 1..time_period.duration-1
      options.push([Date::DAYNAMES[(time_period.start + i).wday], time_period.start + i])
    end
    options
  end

end
