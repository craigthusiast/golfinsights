class StatsController < ApplicationController
  def index
    @rounds = current_user.rounds.all
  end
end
