class Recruitment < ApplicationRecord
  has_many :participant_managements, dependent: :destroy
  has_many :users, through: :participant_managements

  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :appropriate_level, :play_time, presence: true, numericality: { greater_than_or_equal_to: 1}
  validates :start_time, presence: true
  validate :date_before_start_time


  def date_before_start_time
    errors.add(:start_time, "は現在日時以降の時間を指定してください") if start_time < DateTime.now
  end
end
