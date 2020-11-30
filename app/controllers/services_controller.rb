class ServicesController < ApplicationController
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_service, only: [:edit, :update, :destroy]

  def index
    @services = policy_scope(Service).where(company_id: @company)
  end

  def show
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    ##### vérifier si le 'services#create' fonctionne correctement une fois terminé le 'quotes#create' 
    quote = params[:quote_id]
    customer = params[:customer_id]
    service = Service.new(
      ref_service: service_params[:ref_service],
      description_service: service_params[:description_service],
      unit_price: service_params[:unit_price]
    )
    authorize service
    if service.save!
      redirect_to company_customer_quote_path(@company, customer, quote)
    else
      render :new
    end
  end

  def edit
    # authorize @service
  end

  def update
    # @service.update(service_params)
    # authorize @service
    # if @service.save
    #   redirect_to company_services_path(@company)
    # else
    #   render :edit
    # end
  end

  def destroy
    # @service.destroy
    # authorize @service
    # redirect_to company_services_path(@company)
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:ref_service, :description_service, :unit_price)
  end

end
