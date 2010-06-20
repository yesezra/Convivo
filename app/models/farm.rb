# == Schema Information
# Schema version: 20100618200803
#
# Table name: farms
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  organic              :boolean
#  latitude             :float
#  longitude            :float
#  altitude             :float
#  created_at           :datetime
#  updated_at           :datetime
#  organic_certifier_id :integer
#  farmer_id            :integer
#

class Farm < ActiveRecord::Base
  attr_accessible :name, :organic, :latitude, :longitude, :altitude, :organic_certifier_id, :farmer_id

  validates_presence_of :name, :latitude, :longitude, :altitude
  validates_inclusion_of :organic, :in => [true, false]  

  belongs_to :organic_certifier
  belongs_to :farmer
end
