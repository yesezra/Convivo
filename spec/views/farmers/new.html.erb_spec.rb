require 'spec_helper'

describe "/farmers/new" do
  before(:each) do
    render 'farmers/new'
  end
  
  it "should have a name field" do
    response.should have_tag("input[name=?][type=?]", "farmer[name]", "text")
  end
  
  it "should have a drop-down box for washing station" do
    get :new
    response.should have_tag("select[name=?]", "farmer[washing_station_id]")
  end
end
