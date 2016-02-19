class Mission < ActiveRecord::Base
  belongs_to :user

  validates :title,:interval,:times,:when_start_date,:when_start_time,:lasting, presence:true

end
