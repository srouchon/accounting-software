class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :show, :new]
  
  def index
    @customers = policy_scope(Customer).sort
  end
  
  def show
    authorize @customer
  end
  
  def new
    @customer = Customer.new
    authorize @customer
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
    @customer = Customer.find(params[:id])
  end
  
  def set_company
    @company = Company.find(params[:company_id])
  end
  
  def customer_params
    params.require(:customer).permit(:ref_client, :name, :address, :postcode, :city, :phone1, :email1, :phone2, :email2, :siren, :siret)
  end
end
