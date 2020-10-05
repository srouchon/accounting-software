class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    
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
  
  def set_customer
    @customer = customer.find(params[:id])
  end
  
  def customer_params
    params.require(:customer).permit(:ref_client, :name, :address, :postcode, :city, :phone1, :email1, :phone2, :email2, :siren, :siret)
  end
end
