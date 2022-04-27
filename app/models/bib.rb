class Bib < ApplicationRecord
  belongs_to :user
  belongs_to :race
  monetize :price_cents
  validates :price, presence: true
  validates :available, presence: true
  enum available: {
    free: 1,
    unfree: 2
  }
end
