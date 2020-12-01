class QuoteServicesController < ApplicationController
  
  def new
    @quote_service = QuoteService.new
  end
  
  def create
    company = params[:company_id]
    customer = params[:customer_id]
    service = Service.find(params[:service][:service_id])
    quote = Quote.find(params[:quote_id])
    quote_service = QuoteService.new(quote_services_params)
    quote_service.service = service
    quote_service.quote = quote
    quote_service.total_price_service = service.unit_price * quote_service.quantity
    authorize quote_service
    if quote_service.save!
      redirect_to company_customer_quote_path(company, customer, quote)
    else
      render :new
    end
  end
  
  private
  
  def quote_services_params
    params.require(:quote_service).permit(:quantity)
  end
  
end