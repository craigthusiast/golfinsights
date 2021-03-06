class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :courses, dependent: :destroy
  has_many :rounds, through: :courses
  
  validates :first_name, presence: true
  
end
