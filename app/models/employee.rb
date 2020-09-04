class Employee < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :employee_id, presence: true, uniqueness: true
end
