class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  def index
    @rounds = current_user.rounds.all.order("date DESC")
    @courses = current_user.courses.all.order("name ASC")
  end

  def show
  end

  def new
    @round = current_user.rounds.build
    @courses = current_user.courses.all.order("name ASC")
    # @courses = Course.all
    # @tees = Course.tees
  end

  def edit
  end

  def create
    @round = current_user.rounds.build(round_params)
    # @round.course = current_user.courses.find_by_name(params[:name])
    @round.course = Course.find_by_id(:course_id)
    # binding.pry
    # @course = current_user.courses.find(params[:course_id])
    if @round.save
      flash[:success] = "Round added!"
      redirect_to round_path(@round)
    else
      render 'new'
    end
  end

  def update
    if @round.update_attributes(round_params)
      flash[:success] = "Round updated!"
      redirect_to round_path(@round)
    else
      render 'edit'
    end
  end

  def destroy
    if @round.destroy
      flash[:success] = "Round was successfully deleted!"
    else
      flash[:alert] = 'Error while trying to delete the round!'
    end
    redirect_to rounds_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = current_user.rounds.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:date, 
                                    :course_name,
                                    :score, 
                                    :adjusted_score,
                                    :fairways, 
                                    :gir, 
                                    :putts,
                                    :three_putts,
                                    :missed_driver,
                                    :missed_fairway_metal,
                                    :missed_rescue,
                                    :missed_iron_long,
                                    :missed_iron_mid,
                                    :missed_iron_short,
                                    :missed_chip,
                                    :missed_pitch,
                                    :missed_sand,
                                    :missed_putt_long,
                                    :missed_putt_mid,
                                    :missed_putt_short,
                                    :penalties)
    end
end
