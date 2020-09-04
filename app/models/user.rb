class User < ApplicationRecord
  has_many :contents
  validates :name, :telephonenumber, presence: true
  validates :name, length: { maximum: 30 }
end
