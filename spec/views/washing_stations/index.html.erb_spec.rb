require 'spec_helper'

describe "/washing_stations/index" do
  before(:each) do
    assigns[:washing_stations] = @washing_stations = [
      stub_model(WashingStation,
        :new_record? => false,
        :id => 2,
        :name => "WS1",
        :code => "ABC123"
      ),
      stub_model(WashingStation,
        :new_record? => false,
        :id => 3,
        :name => "WS2",
        :code => "124EDS"
      )      
    ]
    
    render
  end

  it "should list all washing stations" do
    @washing_stations.each do |ws|
      response.should have_tag('tr>td', /#{ws.name}/)
      response.should have_tag('tr>td', /#{ws.code}/)
    end
  end
end
