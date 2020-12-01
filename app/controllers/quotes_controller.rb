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
    @quote.services.where(company_id: @company)
    @quote.quote_services.where(quote: @quote)
    authorize @quote
  end

  def update
    @quote.update(description: quote_params[:description], ref_quote: quote_params[:ref_quote]) # ne pas mettre à jour les autres éléments car valeur par défaut 0
    authorize @quote
    if @quote.save!
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
    params.require(:quote).permit(:description, :ref_quote, :deposit, :price_duty_free, :price_all_taxes)
  end
end
