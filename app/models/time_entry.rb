class TimeEntry < ApplicationRecord
  belongs_to :user
  belongs_to :time_period
  belongs_to :project
end
