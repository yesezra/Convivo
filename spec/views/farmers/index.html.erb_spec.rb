require 'spec_helper'

describe "/farmers/index" do
  before(:each) do
    assigns[:farmers] = @farmers = [
      stub_model(Farmer,
        :new_record? => false,
        :name => "A Farmer"
        ),
      stub_model(Farmer,
        :new_record? => false,
        :name => "AnotherFarmer"
      )
    ]
  end


  it "should list all farmers" do
    render
    response.should have_tag('tr>td', /#{@farmers[0].name}/)
    response.should have_tag('tr>td', /#{@farmers[1].name}/)
  end
end
