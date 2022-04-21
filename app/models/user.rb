class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :races
  has_many :bibs, dependent: :destroy
  has_many :orders
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone_number, presence: true
  has_many :authored_chatrooms, class_name: 'Chatroom', foreign_key: 'author_id'
  has_many :received_chatrooms, class_name: 'Chatroom', foreign_key: 'received_id'
  has_many :messages, dependent: :destroy
end
