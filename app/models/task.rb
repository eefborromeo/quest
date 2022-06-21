class Task < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: { minimum: 1}
  validates :details, length: { maximum: 250 }

  scope :with_no_date, -> { where(:date => nil, :completed => false) }
  scope :with_upcoming, -> { where.not(:date => Time.zone.today).where.not('date < ?', Time.zone.today).where('date > ?', Time.zone.today.end_of_week).where(:completed => false) }
  scope :with_this_week, -> { where.not(:date => Time.zone.today).where.not('date < ?', Time.zone.today).where(:date => Time.zone.today.beginning_of_week...Time.zone.today.end_of_week, :completed => false) }
  scope :with_today, -> { where(:date => Time.zone.today, :completed => false) }
  scope :with_overdue, -> { where('date < ?', Time.zone.today).where(:completed => false) }
  scope :with_done, -> { where(:completed => true) }
end
