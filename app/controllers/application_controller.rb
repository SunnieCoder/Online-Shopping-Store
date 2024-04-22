class ApplicationController < ActionController::Base
    before_action :set_cart
    helper_method :current_cart
    before_action :check_and_create_cart, if: :user_signed_in?

    def check_and_create_cart
      if current_user.cart.nil?
        current_user.create_cart
      end
    end

    def current_cart
      if current_user
        current_user.cart
      else
        Cart.find(session[:cart_id])
      end
    end

    def clear_cart
      session[:cart_id] = nil
    end

    private

    def set_cart
      @cart = current_user ? current_user.cart : Cart.new
    end

    # def after_sign_in_path_for(resource)
    #   if resource.is_a?(User)
    #     resource.create_cart unless resource.cart.present?
    #     # Redirect to a specific path after sign-in
    #     shopper_index_path
    #   else
    #     super
    #   end
    # end
end
