class CompaniesController < ApplicationController
  def index
    @companies = policy_scope(Company).sort
  end
  
  def show
    
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
