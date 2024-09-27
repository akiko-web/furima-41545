class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.all.order(created_at: :desc)  # 全ての商品を作成日が新しい順に取得
  end

  def show
    @item = Item.find(params[:id])
  end
  
  private

  def item_params
    # :image を許可することで、画像も一緒に保存できるようにします
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_fee_id, :region_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id) # 他の属性も含めて許可
  end
end
