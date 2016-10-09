class Round < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :holes, dependent: :destroy
  accepts_nested_attributes_for :course
  
  validates :date, :score, :adjusted_score, :course_id, presence: true
  
  before_save :calculate_differential  # Use before_create instead so that it doesn't change inadvertently when the record is subsequently saved
  
  scope :last_twenty, -> { order("handicap_differential ASC", "date DESC").limit(20) }

  def calculate_differential
    # binding.pry
    self.differential = self.score.to_f - self.course.rating
    self.handicap_differential = self.differential * (113 / self.course.slope.to_f)
  end
  
  def self.eligible
    if count < 5
      @eligible_rounds = "Need minimum of 5 rounds to calculate handicap."
    elsif count == 5 || count == 6
      eligible = 1
      @eligible_rounds = self.order('handicap_differential ASC').limit(eligible)
    elsif count == 7 || count == 8
      eligible = 2
      @eligible_rounds = self.order('handicap_differential ASC').limit(eligible)
    elsif count == 9 || count == 10
      eligible = 3
      @eligible_rounds = self.order('handicap_differential ASC').limit(eligible)
    elsif count == 11 || count == 12
      eligible = 4
      @eligible_rounds = self.order('handicap_differential ASC').limit(eligible)
    elsif count == 13 || count == 14
      eligible = 5
      @eligible_rounds = self.order('handicap_differential ASC').limit(eligible)
    elsif count == 15 || count == 16
      eligible = 6
      @eligible_rounds = self.order('handicap_differential ASC').limit(eligible)
    elsif count == 17
      eligible = 7
      @eligible_rounds = self.order('handicap_differential ASC').limit(eligible)
    elsif count == 18
      eligible = 8
      @eligible_rounds = self.order('handicap_differential ASC').limit(eligible)
    elsif count == 19
      eligible = 9
      @eligible_rounds = self.order('handicap_differential ASC').limit(eligible)
    elsif count >= 20
      eligible = 10
      @eligible_rounds = self.order('handicap_differential ASC').limit(eligible)  # Need to add last_twenty into this calculation somehow
      # @eligible_rounds = self.minimum("handicap_differential").pluck.limit(eligible)
    end
  end
  
  def self.handicap
    if count < 5
      @handicap = "Need minimum of 5 rounds to calculate handicap."
    elsif count == 5 || count == 6
      eligible = 1
      @handicap = @eligible_rounds.pluck(:handicap_differential).sum / eligible
    elsif count == 7 || count == 8
      eligible = 2
      @handicap = @eligible_rounds.pluck(:handicap_differential).sum / eligible
    elsif count == 9 || count == 10
      eligible = 3
      @handicap = @eligible_rounds.pluck(:handicap_differential).sum / eligible
    elsif count == 11 || count == 12
      eligible = 4
      @handicap = @eligible_rounds.pluck(:handicap_differential).sum / eligible
    elsif count == 13 || count == 14
      eligible = 5
      @handicap = @eligible_rounds.pluck(:handicap_differential).sum / eligible
    elsif count == 15 || count == 16
      eligible = 6
      @handicap = @eligible_rounds.pluck(:handicap_differential).sum / eligible
    elsif count == 17
      eligible = 7
      @handicap = @eligible_rounds.pluck(:handicap_differential).sum / eligible
    elsif count == 18
      eligible = 8
      @handicap = @eligible_rounds.pluck(:handicap_differential).sum / eligible
    elsif count == 19
      eligible = 9
      @handicap = @eligible_rounds.pluck(:handicap_differential).sum / eligible
    elsif count >= 20
      eligible = 10
      @handicap = @eligible_rounds.pluck(:handicap_differential).sum / eligible
    end
  end
    
end
