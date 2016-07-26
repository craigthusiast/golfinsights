class StatsController < ApplicationController
  def index
    @rounds = Round.all
  end
end
