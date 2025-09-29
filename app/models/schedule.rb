class Schedule < ApplicationRecord
  validates :title, length: {maximum: 20}, presence: true
  validates :start_date, presence: true
  validates :end_date,  presence: true
  validate :end_date_limitation
  validates :remark, length: {maximum: 500}

  def end_date_limitation
    return false if start_date.blank? || end_date.blank?
    if start_date > end_date
      errors.add(:end_date, "に開始日以前の日付は選択できません")
    end
  end
end
