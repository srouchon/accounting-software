class CompaniesController < ApplicationController
  def index
    @companies = policy_scope(Company).sort
  end
  
  def show
    @company = Company.find(params[:id])
    authorize @company
  end
  
  def new
    
  end
  def create
    
  end
  def edit
    
  end
  def update
    
  end
  def destroy
    
  end
end
