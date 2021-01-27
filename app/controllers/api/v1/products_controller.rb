class Api::V1::ProductsController < ActionController::API
  def index
    @products = Product.all()
    render json: @products, include: :category
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
      render json: { error: @product.errors }, status: 400
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product
      @product.update(product_params)
      render json: @product
    else
      render json: { error: @product.errors }, status: 400
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product
      @product.destroy
      render json: { message: 'Product successfully deleted' }, status: 200
    else
      render json: { error: @product.errors }, status: 400
    end
  end

  def product_params
    params.require(:product).permit(:name, :category_id, :size, :color, :price, :category)
  end
end
