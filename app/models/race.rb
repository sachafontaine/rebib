class Race < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bibs

  validates :name, presence: true
  validates :address, presence: true
  validates :address, presence: true
  validates :sport, presence: true
  validates :date, presence: true

  geocoded_by :address
  pg_search_scope :search_by_name,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true }
                  }
  after_validation :geocode, if: :will_save_change_to_address?
  enum sport: {
    running: 0,
    bike: 1,
    triathlon: 2
  }
end
