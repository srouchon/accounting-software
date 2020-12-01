class QuotesController < ApplicationController
  before_action :set_customer, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = policy_scope(Quote).where(customer_id: @customer)
  end

  def show
    @quote_service = QuoteService.new
    authorize @quote
  end

  def new
    @quote = Quote.new
    authorize @quote
  end
  
  def create
    quote = Quote.new(quote_params)
    quote.customer = @customer
    authorize quote
    if quote.save!
      redirect_to company_customer_quote_path(@company, @customer, quote)
    else
      render :new
    end
  end

  def edit
    # @quote.services.where(company_id: @company)
    # @quote.quote_services.where(quote: @quote)
    # authorize @quote
  end

  def update
    # @quote.update(
    #   ref_quote: params[:quote][:ref_quote],
    #   customer_id: params[:quote][:customer_id],
    #   description: params[:quote][:description],
    #   deposit: params[:quote][:deposit],
    #   price_duty_free: params[:quote][:price_duty_free],
    #   price_all_taxes: params[:quote][:price_all_taxes],
    #   customer_id: params[:customer_id]
    #   )
    # authorize @quote
    # if @quote.save
    #   service_attr = params[:quote][:services_attributes]
    #   service_attr.each do |key,value|
    #     @service = Service.find(value[:id])
    #     if @service
    #       @service.update(
    #         ref_service: service_attr[key][:ref_service],
    #         description_service: service_attr[key][:description_service],
    #         unit_price: service_attr[key][:unit_price],
    #         company_id: params[:company_id]
    #       )
    #     end
    #   end
    #   quote_service_attr = params[:quote][:quote_services_attributes]
    #   quote_service_attr.each do |key, value|
    #     quote_service = QuoteService.find(value[:id])
    #     if quote_service
    #       quote_service.update(
    #         quote: @quote,
    #         service: @service,
    #         quantity: quote_service_attr[key][:quantity],
    #         total_price_service: quote_service_attr[key][:total_price_service]
    #       )
    #     end
    #   end
    #   redirect_to company_customer_quote_path(@company, @customer, @quote)
    # else
    #   render :edit
    # end
  end

  def destroy
    @quote.destroy
    authorize @quote
    redirect_to company_customer_quotes_path(@company, @customer)
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
    params.require(:quote).permit(
      :description, 
      :ref_quote, 
      :deposit
      )
  end
end
