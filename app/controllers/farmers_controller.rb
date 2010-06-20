class FarmersController < ApplicationController
  def index
    @farmers = Farmer.find(:all)
    @title = "Farmers"
  end

  def show
    @farmer = Farmer.find(params[:id])
    @title = @farmer.name
  end

  def new
    @farmer = Farmer.new
    @title = "New Farmer"
    @washing_stations = WashingStation.find(:all)
  end

  def edit
    @farmer = Farmer.find(params[:id])
    @title = "Edit #{@farmer.name}"
    @washing_stations = WashingStation.find(:all)
  end

  def create
    @farmer = Farmer.new(params[:farmer])
    if @farmer.save
      redirect_to(@farmer, :notice => 'Farmer was successfully created.') 
    else
      render :action => "new"
    end
  end
  
  def update
    @farmer = Farmer.find(params[:id])

    if @farmer.update_attributes(params[:farmer])
      redirect_to(@farmer, :notice => 'Farmer was successfully updated.')
    else
      render :action => "edit"        
    end
  end
  
  def destroy
    @farmer = Farmer.find(params[:id])
    @farmer.destroy
    redirect_to(farmers_url, :notice => 'Farmer was deleted.')
  end
end
