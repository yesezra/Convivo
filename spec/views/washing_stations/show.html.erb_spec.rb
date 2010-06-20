require 'spec_helper'

describe "/washing_stations/show" do
  before(:each) do
    assigns[:washing_station] = @washing_station = stub_model(WashingStation,
      :new_record? => false,
      :id => 2,
      :name => "WS1",
      :code => "ABC123"
    )
    
    render
  end


  it "should include the washing station name" do
    response.should have_tag("h2", /#{@washing_station.name}/)
  end
  
  it "should include the washing station code" do
    response.should have_tag("h3", /#{@washing_station.code}/)
  end

end
