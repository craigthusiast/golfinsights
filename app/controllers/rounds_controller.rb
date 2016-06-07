class RoundsController < ApplicationController
    before_action :set_round, only: [:show, :edit, :update, :destroy]

  def index
    @rounds = Round.where(user: current_user).order("date DESC")
    @courses = Course.all 
  end

  def show
  end

  def new
    @round = Round.new
    @courses = Course.all
    # @tees = Course.tees
  end

  def edit
  end

  def create
    @round = current_user.rounds.build(round_params)

    respond_to do |format|
      if @round.save
        format.html { redirect_to @round, notice: 'Round was successfully created.' }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to rounds_url, notice: 'Round was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:date, 
                                    :user_id, 
                                    :course_id,
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
