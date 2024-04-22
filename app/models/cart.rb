class Cart < ApplicationRecord
    #belongs_to :user
    has_many :lineitems, dependent: :destroy
    #has_many :cart_items, dependent: :destroy


    def add_item(product_id)
        current_item = self.lineitems.find_by(product_id: product_id)
        if current_item
            current_item.quantity += 1

        else
            current_item = self.lineitems.build(product_id: product_id)
        end
        current_item
    end

    def total_price_in_this_cart
        self.lineitems.to_a.sum do |item|
            item.total_price_of_items
        end
    end
end
