class HandicapController < ApplicationController
  
  def index
    @rounds = current_user.rounds.all
    # @eligible_rounds = Round.eligible
    @eligible_rounds = current_user.rounds.eligible
    @handicap = Round.handicap
    @last_20 = Round.all.order('date DESC').first(20)
    @all_rounds = Round.all.order('date DESC')
  end

end
