class Race < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bibs
end
