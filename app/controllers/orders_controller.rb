class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user == current_user || @item.item_record.present?
      redirect_to root_path
    end
    @example_form = ExampleForm.new
  end

  def create
    @example_form = ExampleForm.new(example_form_params)
    if @example_form.valid?
      pay_item
      @example_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def example_form_params
    params.require(:example_form).permit(:postal_code, :region_id, :city, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_85be34af8f0c151120bb90dc"  
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: example_form_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
