class Course < ApplicationRecord
  belongs_to :user
  has_many :rounds, dependent: :destroy
  
  validates :name, :par, :rating, :slope, presence: true
end
