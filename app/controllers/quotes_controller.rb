class QuotesController < ApplicationController
  before_action :set_customer, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = policy_scope(Quote)
  end

  def show
    authorize @quote
  end

  def new
    @quote = Quote.new
    @quote.services.build
    @quote.quote_services.build
    authorize @quote
  end

  # params[:quote][:services_attributes]['0'][:ref_service]
  
  def create
    @quote = Quote.new(
      ref_quote: params[:ref_quote],
      customer_id: params[:customer_id],
      description: params[:description],
      deposit: params[:deposit],
      price_duty_free: nil,
      price_all_taxes: nil
      )
    authorize @quote
    if @quote.save
      service_attr = params[:quote][:services_attributes]
      service_attr.each do |key,value|
        @service = Service.create(
          ref_service: service_attr[key][:ref_service],
          description_service: service_attr[key][:description_service],
          unit_price: service_attr[key][:unit_price],
          company_id: params[:company_id]
        )
      end
      quote_service_attr = params[:quote][:quote_services_attributes]
      quote_service_attr.each do |key, value|
        QuoteService.create(
          quote: @quote,
          service: @service,
          quantity: quote_service_attr[key][:quantity],
          total_price_service: quote_service_attr[key][:total_price_service]
          )
        end
      redirect_to company_customer_quote_path(@company, @customer, @quote)
    else
      render :new
    end
  end

  def edit
    @quote.services.build
    @quote.quote_services.build
    authorize @quote
  end

  def update
    @quote.update(quote_params)
    authorize @quote
    if @quote.save
      redirect_to company_customer_quote_path(@company, @customer, @quote)
    else
      render :edit
    end
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
      :deposit, 
      services_attributes: [
        :_destroy, 
        :ref_service, 
        :description_service, 
        :unit_price
        ],
      quoteservices_attributes: [
        :quantity, 
        :total_price_service
        ]
      )
  end
end
