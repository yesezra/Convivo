require 'spec_helper'

describe "/farmers/edit.html.erb" do
  include FarmersHelper

  before(:each) do
    assigns[:farmer] = @farmer = stub_model(Farmer,
      :new_record? => false,
      :name => "A Farmer",
      :washing_station_id => "2"
    )
    assigns[:washing_stations] = @washing_stations = [stub_model(WashingStation,
      :new_record? => false,
      :id => 2,
      :name => "WS1",
      :code => "ABC123"
    )]
    
    render
  end

  it "renders the edit farmer form" do
    response.should have_tag("form[action=#{farmer_path(@farmer)}][method=post]") do
      with_tag('input#farmer_name[name=?]', "farmer[name]")
    end
  end
  
  it "should have washingstations in a dropdown box" do
    response.should have_tag("select[name=?]", "farmer[washing_station_id]")
  end
  
  it "should have all washing stations as options" do
    response.should have_tag("option[value=?]", @washing_stations.first.id)
    response.should have_tag("option", "WS1")
  end
end

