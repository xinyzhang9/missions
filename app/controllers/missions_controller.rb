class MissionsController < ApplicationController
  def index
  end

  def create
    interval = params[:interval_h].to_i*60 + params[:interval_m].to_i
    if params[:night_mode] == "on"
        night_mode = true
    else
        night_mode = false
    end
    @mission = Mission.new(title:params[:title],interval:interval,
      times:params[:times],when_start_date:params[:when_start_date],
      when_start_time:params[:when_start_time],lasting:params[:lasting],
      night_mode:night_mode)
    if !@mission.valid?
      flash[:errors] = @mission.errors.full_messages
      redirect_to :back
      
    else
      @mission.user = current_user
      @mission.save
     
      SchedulersController.new_missison(@mission) 
      redirect_to "/users/#{current_user.id}"
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end
#   def get_last
#     @mission = current_user.mission.last
#   end
#   def self.get_last_mission
#     self.get_last
#     mission = @mission
#     return mission
#   end
# helper_method :get_last
  
end
