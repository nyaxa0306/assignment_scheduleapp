class Schedule < ApplicationRecord
  validates :title, length: {maximum: 20}, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :remark, length: {maximum: 500}
end
