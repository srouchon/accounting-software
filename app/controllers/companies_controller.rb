class CompaniesController < ApplicationController
  def index
    @companies = policy_scope(Company).sort
  end
  
  def show
    @company = Company.find(params[:id])
    authorize @company
  end
  
  def new
    @company = Company.new
    authorize @company
  end
  
  def create
    @company = Company.new(company_params)
    authorize @company
    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
    
  end
  def edit
    
  end
  def update
    
  end
  def destroy
    
  end
  
  private
  
  def company_params
    params.require(:company).permit(:name, :address, :postcode, :city, :phone, :email, :siret)
  end
end
