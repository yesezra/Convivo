require 'spec_helper'

describe Farmer do

  before(:each) do
    @washing_station = Factory(:washing_station)
    @valid_attributes = {
      :name => "Farmer Name"
    }
  end

  it "should create a new instance given valid attributes" do
    @washing_station.farmers.create!(@valid_attributes)
  end
  
  it "should require a name" do
    no_name_farmer = Farmer.new(@valid_attributes.merge(:name => ""))
    no_name_farmer.should_not be_valid
  end
  
  describe "washing station associations" do
    
    before(:each) do
      @farmer = @washing_station.farmers.create(@valid_attributes)
    end
    
    it "should have a washing station attribute" do
      @farmer.should respond_to(:washing_station)
    end
    
    it "should have the right associated washing station" do
      @farmer.washing_station.should == @washing_station
    end
  end

  describe "farm associations" do

    before(:each) do
      @farmer = Farmer.create(@valid_attributes)
    end

    it "should have a farm attribute" do
      @farmer.should respond_to(:farms)
    end
  end
  
end
