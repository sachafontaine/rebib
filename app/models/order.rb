class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bib
  monetize :amount_cents
end
