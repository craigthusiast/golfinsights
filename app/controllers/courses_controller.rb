class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    # @courses = Course.where(user: current_user).order("name ASC")
    @courses = current_user.courses.all.order("name ASC")
  end
  
  def all
    @courses = Course.all.order("name ASC")  # This (or the callback) isn't working
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    # @rounds = current_user.courses(course_params).rounds.order('date DESC')  # Need to fix this to show user.course.rounds
  end

  # GET /courses/new
  def new
    @course = current_user.courses.build
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      flash[:success] = "Course added!"
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    if @course.update_attributes(course_params)
      flash[:success] = "Course updated!"
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    if @course.destroy
      flash[:success] = "Course successfully deleted!"
    else
      flash[:alert] = 'Error while trying to delete the course!'
    end
    redirect_to courses_url
  end
  
  def import
    @courses = current_user.courses.import(params[:file])
    redirect_to courses_path, flash[:success] = "Courses imported successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      # @course = Course.find(params[:id])
      @course = current_user.courses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :par, :rating, :slope, :favourite, :tees, :yardage)
    end
    
    def correct_user
      @goal = current_user.courses.find(params[:id])
      redirect_to authenticated_root_path, notice: "Not authorized to edit this course." if @course.nil?
    end
    
end
