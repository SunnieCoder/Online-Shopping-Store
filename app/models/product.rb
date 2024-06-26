class Product < ApplicationRecord
    validates(:name, :description, :image, presence: true)
    validates(:price, numericality: {greater_than_or_equal_to: 0.01})
    validates(:name, uniqueness: true)
    validates(:image, format: {with: %r{\.(gif|jpg|png)\Z}i, message: 'file must be a URL for GIF, JPG or PNG image.'})

    has_many :line_items
    before_destroy (:make_sure_no_line_items)

    def make_sure_no_line_items
        if self.lineitems.empty?
            return true
        else
            return false
        end
    end
end
