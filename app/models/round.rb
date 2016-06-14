class Round < ActiveRecord::Base
    belongs_to :user
    belongs_to :course
    has_many :holes
    
    before_save :calculate_differential
    # default_scope { order("date DESC") }
    
    def calculate_differential
        # self.differential = self.score - 2
        self.differential = self.score.to_f - self.course.rating
        self.handicap_differential = self.differential * (113 / self.course.slope.to_f)
    end
    
    def self.last_twenty
        self.order("handicap_differential ASC", "date DESC").limit(20)
    end
    
    def self.lowest_two
        self.last_twenty.first(2)
    end
    
    def self.handicap
        self.lowest_two.average(:handicap_differential)
    end
    
    # def calculate_handicap
    #     # handicap = avg of lowest 10 of last 20 rounds 
    #     last_20 = Round.order("date DESC").limit(20)
    # end
    
end
