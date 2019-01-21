class Product < ApplicationRecord
  # validations
  validates_presence_of :title, :price, :inventory_count

  scope :available, -> { where("inventory_count > 0") }

  public
  def self.sell_inventory(id)
    @product = Product.find(id)
    if @product.inventory_count > 0
      @product.inventory_count -= 1
      @purchase_status = "Purchase successful"
    else
      @purchase_status = "Purchase failed, no available inventory"
    end
    @result = { "Product" => @product, 'Purchase Status' => @purchase_status }
  end
end
