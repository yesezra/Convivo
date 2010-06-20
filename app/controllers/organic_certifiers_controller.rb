class OrganicCertifiersController < ApplicationController
  def index
    @organic_certifiers = OrganicCertifier.find(:all)
    @title = "Organic Certifiers"
  end

  def show
    @organic_certifier = OrganicCertifier.find(params[:id])
    @title = @organic_certifier.name
  end

  def new
    @organic_certifier = OrganicCertifier.new
    @title = "New Organic Certifier"
  end

  def edit
    @organic_certifier = OrganicCertifier.find(params[:id])
    @title = "Edit #{@organic_certifier.name}"
  end
  
  def create
    @organic_certifier = OrganicCertifier.new(params[:organic_certifier])
    if @organic_certifier.save
      redirect_to(@organic_certifier, :notice => 'Organic Certifier was successfully created.') 
    else
      render :action => "new"
    end
  end

  def update
    @organic_certifier = OrganicCertifier.find(params[:id])

    if @organic_certifier.update_attributes(params[:organic_certifier])
      redirect_to(@organic_certifier, :notice => 'Organic Certifier was successfully updated.')
    else
      render :action => "edit"        
    end
  end
  
  def destroy
    @organic_certifier = OrganicCertifier.find(params[:id])
    @organic_certifier.destroy
    redirect_to(organic_certifiers_url, :notice => 'Organic Certifier was deleted.')
  end
  
end
