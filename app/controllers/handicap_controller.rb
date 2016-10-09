class HandicapController < ApplicationController
  
  def index
    @rounds = current_user.rounds.all
    # @eligible_rounds = Round.eligible
    @eligible_rounds = current_user.rounds.eligible
    @handicap = current_user.rounds.handicap
    @last_20 = current_user.rounds.all.order('date DESC').first(20)
    @all_rounds = current_user.rounds.all.order('date DESC')
  end

end
