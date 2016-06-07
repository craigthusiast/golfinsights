class Round < ActiveRecord::Base
    belongs_to :user
    belongs_to :course
    has_many :holes
    
    before_save :calculate_differential
    
    def calculate_differential
        # self.differential = self.score - 2
        self.differential = self.score.to_f - self.course.rating
        self.handicap_differential = self.differential * (113 / self.course.slope.to_f)
    end
    
end
