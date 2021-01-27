class Api::V1::CategoriesController < ActionController::API
  def index
    @categories = Category.all()
    render json: @categories
  end

  def show
    @product = Category.find(params[:id])
    render json: @product
  end

  def create
    @category = Category.new(category_params)
    print(category_params)
    if @category.save
      render json: @category
    else
      render json: { error: @category.errors }, status: 400
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category
      @category.update(category_params)
      render json: @category
    else
      render json: { error: @category.errors }, status: 400
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category
      @category.destroy
      render json: { message: 'Category successfully deleted' }, status: 200
    else
      render json: { error: 'Unable to delete category' }, status: 400
    end
  end

  def category_params
    params.require(:category).permit!
  end
end


