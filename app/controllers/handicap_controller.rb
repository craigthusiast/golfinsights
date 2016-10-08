class HandicapController < ApplicationController
  
  def index
    @rounds = Round.all
    @eligible_rounds = Round.eligible
    # @eligible_rounds = Round.eligible.order('date DESC')  # How do I use this method to override the order from the model?
    @handicap = Round.handicap
    @last_20 = Round.all.order('date DESC').first(20)
    @all_rounds = Round.all.order('date DESC')
  end

end
