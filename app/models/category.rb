class Category < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_one_attached :icon
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
end
