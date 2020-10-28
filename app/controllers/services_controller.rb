class ServicesController < ApplicationController
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @services = policy_scope(Service)
  end

  def show
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    authorize @service
    if @service.save
      redirect_to company_services_path(@company)
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

  def service_params
    params.require(:service).permit(:description_service, :ref_service, :unit_price, :quantity, :total_price_service)
  end

end
