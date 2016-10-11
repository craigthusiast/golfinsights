class Course < ApplicationRecord
  belongs_to :user
  has_many :rounds, dependent: :destroy
  
  validates :name, :par, :rating, :slope, presence: true
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      self.create! row.to_hash
    end
  end
  
end
