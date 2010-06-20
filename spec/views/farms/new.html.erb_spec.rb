require 'spec_helper'

describe "/farms/new" do
  before(:each) do
     assigns[:farm] = @farm = stub_model(Farm,
       :new_record? => false
     )
     
     assigns[:organic_certifiers] = @organic_certifiers = [
      stub_model(OrganicCertifier,
        :new_record? => false,
        :id => 2,
        :name => "OC2",
        :code => "ABC123"
      ),
      stub_model(OrganicCertifier,
        :new_record? => false,
        :id => 3,
        :name => "OC3",
        :code => "33333"
      )
     ]

     assigns[:farmers] = @farmers = [
      stub_model(Farmer,
        :new_record? => false,
        :id => 2,
        :name => "A Farmer"
      ),
      stub_model(Farmer,
        :new_record? => false,
        :id => 3,
        :name => "Another Farmer"
      )
     ]

     render
   end

   it "renders the edit farm form" do
     response.should have_tag("form[action=#{farm_path(@farm)}][method=post]") do
       with_tag('input#farm_name[name=?]', "farm[name]")
       with_tag('input#farm_organic[name=?][type=checkbox]', "farm[organic]")
       with_tag('input#farm_latitude[name=?]', "farm[latitude]")
       with_tag('input#farm_longitude[name=?]', "farm[longitude]")
       with_tag('input#farm_altitude[name=?]', "farm[altitude]")
     end
   end

   it "should have organic_farmers in a dropdown box" do
     response.should have_tag("select[name=?]", "farm[organic_certifier_id]")
   end

   it "should have all organic certifiers as options" do
     @organic_certifiers.each do |oc|
       response.should have_tag("option[value=?]", oc.id)
       response.should have_tag("option", oc.name)      
     end
   end
   
   it "should have farmers in a dropdown box" do
     response.should have_tag("select[name=?]", "farm[farmer_id]")
   end

   it "should have all farmers as options" do
     @farmers.each do |f|
       response.should have_tag("option[value=?]", f.id)
       response.should have_tag("option", f.name)      
     end
   end

end
