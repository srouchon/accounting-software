class ServicesController < ApplicationController
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  def index
    @services = policy_scope(Service)
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
  
  private
  
  def set_company
    @company = Company.find(params[:company_id])
  end
  
  def service_params
    params.require(:service).permit(:description_service, :ref_service, :unit_price, :quantity, :total_price_service)
  end
  
end
