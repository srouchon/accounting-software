class ServicesController < ApplicationController
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_customer, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_quote, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  def index
    @services = policy_scope(Service)
  end
  
  def new
    @service = Service.new
    @quoteservice = QuoteService.new
    authorize @service
    authorize @quoteservice
  end
  
  def create
    @service = Service.new(ref_service: service_params[:ref_service], description_service: service_params[:description_service], unit_price: service_params[:unit_price])
    authorize @service
    if @service.save
      @quoteservice = QuoteService.create(quote: @quote, service: @service, quantity: service_params[:quantity], total_price_service: service_params[:total_price_service])
      authorize @quoteservice
      redirect_to company_customer_quote_path(@company, @customer, @quote)
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def updates
    
  end
  
  def destroy
    
  end
  
  private
  
  def set_company
    @company = Company.find(params[:company_id])
  end
  
  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
  
  def set_quote
    @quote = Quote.find(params[:quote_id])
  end
  
  def service_params
    params.require(:service).permit(:description_service, :ref_service, :unit_price, :quantity, :total_price_service)
  end
  
end
