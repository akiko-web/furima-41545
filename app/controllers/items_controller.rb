class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が正常に出品されました。'
    else
      render :new
    end
  end

  private

  def item_params
    # :image を許可することで、画像も一緒に保存できるようにします
    params.require(:item).permit(:name, :description, :price, :image)  # 他の属性も含めて許可
  end
end
