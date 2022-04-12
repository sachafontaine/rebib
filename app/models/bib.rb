class Bib < ApplicationRecord
  belongs_to :user
  belongs_to :race
  monetize :price_cents
end
