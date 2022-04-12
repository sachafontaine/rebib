class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :bibs, dependent: :destroy
  has_many :orders
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone_number, presence: true
end
