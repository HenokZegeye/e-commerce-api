class CartItemsController < ApplicationController
    before_action :set_cart_item, only: [:show, :update, :destroy]
  
  # GET /carts
  def index
    @cart_items = CartItem.all

    render json: @cart_items
  end

  # GET /carts/1
  def show
    render json: @cart_item
  end

  # POST /carts
  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      render json: @cart_item, status: :created
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # POST /bulk_create

  def bulk_create
    cart_items = bulk_create_params[:cart_items]
    new_cart_items = []
    debugger
    cart_items.each do |item_id, cart_id|
      new_cart_items << CartItem.new(item_id: item_id, cart_id: cart_id)
    end
    
    new_cart_items.each(&:save!)

    render json: new_cart_items 
  end
  

  # PATCH/PUT /carts/1
  def update
    if @cart_item.update(cart_item_params)
      render json: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart_item.destroy
  end

  private

    def bulk_create_params
      params.permit(cart_items: %I[cart_id item_id quantity])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_item_params
      params.permit(:cart_id, :item_id, :quantity) 
    end
end
