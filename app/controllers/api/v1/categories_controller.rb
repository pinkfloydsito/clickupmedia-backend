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
    @category = Category.new(category_params.except(:keywords_attributes))
    params[:keywords_attributes].each do |i|
      @category.keywords << Keyword.create_or_find_by(name: i[:id])
    end
    if @category.save
      render json: @category
    else
      render json: { error: @category.errors }, status: 400
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category
      @category.keywords.destroy_all
      @category.update(category_params.except(:keywords_attributes))
      params[:keywords_attributes].each do |i|
        @category.keywords << Keyword.create_or_find_by(name: i[:id])
      end
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
