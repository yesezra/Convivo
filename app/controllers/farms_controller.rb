class FarmsController < ApplicationController
  def index
    @farms = Farm.find(:all)
    @title = "Farms"
  end

  def show
    @farm = Farm.find(params[:id])
    @title = @farm.name
  end

  def new
    @farm = Farm.new
    @title = "New Farm"
    @organic_certifiers = OrganicCertifier.find(:all)
    @farmers = Farmer.find(:all)
  end

  def edit
    @farm = Farm.find(params[:id])
    @title = "Edit #{@farm.name}"
    @organic_certifiers = OrganicCertifier.find(:all)
    @farmers = Farmer.find(:all)
  end
  
  def create
    @farm = Farm.new(params[:farm])
    if @farm.save
      redirect_to(@farm, :notice => 'Farm was successfully created.') 
    else
      render :action => "new"
    end
  end

  def update
    @farm = Farm.find(params[:id])

    if @farm.update_attributes(params[:farm])
      redirect_to(@farm, :notice => 'Farm was successfully updated.')
    else
      render :action => "edit"        
    end
  end
  
  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy
    redirect_to(farms_url, :notice => 'Farm was deleted.')
  end
  
end
