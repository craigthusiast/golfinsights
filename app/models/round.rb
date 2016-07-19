class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :holes
  
  before_save :calculate_differential
  before_save :eligible
  
  scope :last_twenty, -> { order("handicap_differential ASC", "date DESC").limit(20) }
  # default_scope { order("handicap_differential ASC", "date DESC").limit(1) }

  def calculate_differential
      # self.differential = self.score - 2
      self.differential = self.score.to_f - self.course.rating
      self.handicap_differential = self.differential * (113 / self.course.slope.to_f)
  end
  
  def eligible
    high = 20
    low = 5
    if self.size >= high && self.last_twenty?
      self.handicap_eligible = true
    elsif self.size < high and self.size >= low
      self.handicap_eligible = true
    else
      self.handicap_eligible = false
    end
  end

  def self.lowest_ten
    self.last_twenty.first(10)
  end
    
  def self.handicap
    self.average(:handicap_differential)
  end
  
  # def self.handicap
  #   if self.size == 5 or 6
  #     self.handicap = lowest(1)
  #   elsif self.size = 7 or 8
  #     self.handicap = lowest(2).average(:handicap_differential)
  #   elsif self.size = 9 or 10
  #     self.handicap = lowest(3).average(:handicap_differential)
  #   elsif self.size = 11 or 12
  #     self.handicap = lowest(4).average(:handicap_differential)
  #   elsif self.size = 13 or 14
  #     self.handicap = lowest(5).average(:handicap_differential)
  #   elsif self.size = 15 or 16
  #     self.handicap = lowest(6).average(:handicap_differential)
  #   elsif self.size = 17
  #     self.handicap = lowest(7).average(:handicap_differential)
  #   elsif self.size = 18
  #     self.handicap = lowest(8).average(:handicap_differential)
  #   elsif self.size = 19
  #     self.handicap = lowest(9).average(:handicap_differential)
  #   else self.size >= 20
  #     self.handicap = lowest(10).average(:handicap_differential)
  # end
    
end
