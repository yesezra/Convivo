require 'spec_helper'

describe "/farmers/edit" do
  before(:each) do
    @farmer = mock_model(Farmer)
    assigns[:farmer] = @farmer
    @farmer.should_receive(:name).and_return("A Farmer")
    @farmer.should_receive(:washing_station_id).and_return("0")
    render 'farmers/edit'
  end
    
  it "should have the right title" do

    response.should have_tag("title")
  end
  
end
