class BillsController < ApplicationController
  before_action :set_customer, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    @bills = policy_scope(Bill)
  end
  
  def show
    authorize @bill
  end
  
  def new
    @bill = Bill.new
    authorize @bill
  end
  
  def create
    @bill = Bill.new(bill_params)
    @bill.customer = @customer
    authorize @bill
    if @bill.save
      redirect_to company_customer_bill_path(@company, @customer, @bill)
    else
      render :new
    end
  end
  
  def edit
    authorize @bill
  end
  
  def update
    @bill.update(bill_params)
    authorize @bill
    if @bill.save
      redirect_to company_customer_bill_path(@company, @customer, @bill)
    else
      render :edit
    end
  end
  
  def destroy
    @bill.destroy
    authorize @bill
    redirect_to company_customer_bills_path(@company, @customer)
  end
  
  private
  
  def set_bill
    @bill = Bill.find(params[:id])
  end
  
  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
  
  def set_company
    @company = Company.find(params[:company_id])
  end
  
  def bill_params
    params.require(:bill).permit(:description, :ref_bill, :deposit, :price_duty_free, :price_all_taxes)
  end
end
