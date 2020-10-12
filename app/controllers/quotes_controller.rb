class QuotesController < ApplicationController
  before_action :set_customer, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_quote, only: [:show]

  def index
    @quotes = policy_scope(Quote)
  end
  
  def show
    authorize @quote
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
  
  def set_quote
    @quote = Quote.find(params[:id])
  end
  
  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
  
  def set_company
    @company = Company.find(params[:company_id])
  end
  
  def quote_params
    params.require(:quote).permit()
  end
end