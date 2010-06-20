require 'spec_helper'

describe "/farmers/show" do
  before(:each) do
    @farmer = Factory(:farmer)
    render 'farmers/show', :id => @farmer
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/farmers/show])
  end
  
  it "should include the farmer's name" do
    response.should have_tag("h2", /#{@farmer.name}/)
  end
end
