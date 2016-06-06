class UsersController < ApplicationController
  def index
  end
  
  private
  
  def user_params
      params.require(:user).permit(:first_name, :last_name)
  end
  
end