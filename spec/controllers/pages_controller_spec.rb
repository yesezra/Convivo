require 'spec_helper'

describe PagesController do
  integrate_views
  
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_tag("title", /welcome/i)
    end
    
    it "should welcome" do
      get 'home'
      response.should have_tag("h1", /welcome to convivo/i)
    end
  end
end
