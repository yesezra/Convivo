class WashingStationsController < ApplicationController
  def index
    @washing_stations = WashingStation.find(:all)
    @title = "Washing Stations"
  end

  def show
    @washing_station = WashingStation.find(params[:id])
    @title = @washing_station.name
  end

  def new
    @washing_station = WashingStation.new
    @title = "New Washing Station"
  end

  def edit
    @washing_station = WashingStation.find(params[:id])
    @title = "Edit #{@washing_station.name}"
  end

  def create
    @washing_station = WashingStation.new(params[:washing_station])
    if @washing_station.save
      redirect_to(@washing_station, :notice => 'Washing Station was successfully created.') 
    else
      render :action => "new"
    end
  end
  
  def update
    @washing_station = WashingStation.find(params[:id])

    if @washing_station.update_attributes(params[:washing_station])
      redirect_to(@washing_station, :notice => 'Washing Station was successfully updated.')
    else
      render :action => "edit"        
    end
  end

  def destroy
    @washing_station = WashingStation.find(params[:id])
    @washing_station.destroy
    redirect_to(washing_stations_url, :notice => 'Washing Station was deleted.')
  end

end
