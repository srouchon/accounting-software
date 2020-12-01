class QuoteServicesController < ApplicationController
  before_action :set_company, only: [:create, :destroy]
  before_action :set_customer, only: [:create, :destroy]
  before_action :set_quote, only: [:create, :destroy]

  def new
    @quote_service = QuoteService.new
  end
  
  def create
    service = Service.find(params[:service][:service_id])
    @quote_service = QuoteService.new(quote_services_params)
    @quote_service.service = service
    @quote_service.quote = @quote
    @quote_service.total_price_service = service.unit_price * @quote_service.quantity
    authorize @quote_service
    if @quote_service.save!
      @quote.update(price_duty_free: (@quote.price_duty_free + @quote_service.total_price_service))
      redirect_to company_customer_quote_path(@company, @customer, @quote)
    else
      render :new
    end
  end
  
  def destroy
    quote_service = QuoteService.find(params[:id])
    @quote.update(price_duty_free: (@quote.price_duty_free - quote_service.total_price_service))
    quote_service.destroy
    authorize quote_service
    redirect_to company_customer_quote_path(@company, @customer, @quote)
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

  def quote_services_params
    params.require(:quote_service).permit(:quantity)
  end
  
end