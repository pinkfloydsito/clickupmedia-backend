class Api::V1::ProductsController < ActionController::API
  def index
    @products = Product.all()
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product
    else
      render error: { error: 'Unable to create product' }, status: 400
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product
      @product.update(product_params)
      render json: @product
    else
      render error: { error: 'Unable to update product' }, status: 400
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product
      @product.destroy
      render json: { message: 'Product successfully deleted' }, status: 200
    else
      render error: { error: 'Unable to delete product' }, status: 400
    end
  end

  def product_params
    params.require(:product).permit(:name)
  end
end


