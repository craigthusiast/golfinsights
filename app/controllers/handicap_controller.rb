class HandicapController < ApplicationController
  
  def index
    @rounds = Round.all
    @eligible_rounds = Round.eligible
    @handicap = Round.handicap
  end

end
