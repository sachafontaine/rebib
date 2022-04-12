class Race < ApplicationRecord
  include PgSearch::Model
  has_many :bibs
  has_one_attached :photo
  geocoded_by :address
  pg_search_scope :search_by_name,
    against: [ :name ],
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
