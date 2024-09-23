class ShippingFee < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '送料込み' },
    { id: 2, name: '着払い' }
  ]
end
