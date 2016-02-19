require 'rufus-scheduler'
class SchedulersController < ApplicationController

  def self.new_missison(mission)
    counter = "scheduler"+mission.id.to_s
    counter = Rufus::Scheduler.new
    # puts mission
    # mission= MissionsController.get_last_mission
    interval = mission.interval
    times = mission.times
    # for demo purpose, we use second and mintues to replace mmintues and day
    if interval !=0
      counter.interval "#{interval}s",:last_in=>"#{mission.lasting}m" do
        TwiliosController.message(mission)
      end
    else
      counter.interval "#{144/times}m" do
        TwiliosController.message(mission)
      end
    end
  end
#please test
  def self.destroy(mission)
    counter = "scheduler"+mission.id.to_s
    counter.kill if counter.running?
  end
end
