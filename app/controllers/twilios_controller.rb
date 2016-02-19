require 'twilio-ruby'
class TwiliosController < ApplicationController
  def self.message(mission)
    # puts mission.id
    # mission = MissionsController.get_last_mission
    phone = mission.user.phone
    # puts phone
    content = mission.title
    mission_id = mission.id
    account_sid = 'ACdd078a926017612a8b54f7c37ac5a2b5' 
    auth_token = 'f42f7d7212e445987f92d27795124305'
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+17348871490"
 
    friends = {
    phone => ""
    }
    friends.each do |key, value|
        client.account.messages.create(
          :from => from,
          :to => key,
          :body => "Hey #{mission.user.first_name}, Please check your mission -- #{content}!"
        )
        puts "Sent message to #{content}"
      end
    end
end
