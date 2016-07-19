class HandicapController < ApplicationController
  
  def index
    # @rounds = Round.all
    @rounds = Round.lowest_ten
    @handicap = Round.handicap
  end

end
