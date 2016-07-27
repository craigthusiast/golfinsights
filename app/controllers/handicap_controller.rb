class HandicapController < ApplicationController
  
  def index
    @rounds = Round.all
    @eligible_rounds = Round.eligible
    # @eligible_rounds = Round.eligible.order('date DESC')  # How do I use this method to override the order from the model?
    @handicap = Round.handicap
  end

end
