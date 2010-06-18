# == Schema Information
# Schema version: 20100618200803
#
# Table name: farmers
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  washing_station_id :integer
#

class Farmer < ActiveRecord::Base
  attr_accessible :name
  
  validates_presence_of :name
  
  has_many :farms
  belongs_to :washing_station
end
