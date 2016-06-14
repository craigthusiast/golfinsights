class HandicapController < ApplicationController
  def index
    # @lowest_ten = Round.last_twenty.order("handicap_differential ASC").limit(10)
    @rounds = Round.lowest_two
    @handicap = Round.handicap
  end
end
