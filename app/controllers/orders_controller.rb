class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @example_form = ExampleForm.new
  end

  def create
    @example_form = ExampleForm.new(example_form_params)
    if @example_form.valid?
      @example_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def example_form_params
    params.require(:example_form).permit(:postal_code, :region_id, :city, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
