require 'spec_helper'

describe WashingStation do
  before(:each) do
    @valid_attributes = {
      :name => "Washing Station",
      :code => "abc123"
    }
  end

  it "should create a new instance given valid attributes" do
    WashingStation.create!(@valid_attributes)
  end
  
  it "should require a code" do
    no_name_washing_station = WashingStation.new(@valid_attributes.merge(:name => ""))
    no_name_washing_station.should_not be_valid
  end
  
  it "should require a code" do
    no_code_washing_station = WashingStation.new(@valid_attributes.merge(:code => ""))
    no_code_washing_station.should_not be_valid
  end
  
end
