class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :all_day, inclusion: { in: [true, false] }
  validate :start_end_check

  def start_end_check
    errors.add(:end_date, 'は開始日より前の日付で登録できません') unless
    self.start_date < self.end_date
  end
end
