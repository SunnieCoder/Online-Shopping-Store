class OrdersController < ApplicationController
  include(CurrentCart)
  before_action :authenticate_user!
  before_action :set_cart
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    if @cart.lineitems.empty?
      redirect_to(shopper_url, notice: "Your cart is empty")
      return
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    # add order_id in lineitems 
    @order = Order.new(order_params)

    @order.add_order_id_in_lineitems(@cart)

    respond_to do |format|
      if @order.save
        clear_cart
        # format.html { redirect_to shopper_url, notice: "Order was successfully created." }
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :paytype)
    end

    def clear_cart
      @cart.lineitems.destroy_all # Remove all line items associated with the cart
      session[:cart_id] = nil
    end
end
