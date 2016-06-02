class Round < ActiveRecord::Base
    belongs_to :user
    # has_one :course
    belongs_to :course
    has_many :holes
end
