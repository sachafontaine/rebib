class Race < ApplicationRecord
  include PgSearch::Model
  has_one_attached :photo
  has_many :bibs
  geocoded_by :address
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
  after_validation :geocode, if: :will_save_change_to_address?
  enum sport: {
    Running: 0,
    Bike: 1,
    Triathlon: 2
  }
end
