class Api::V1::KeywordsController < ActionController::API
  def index
    @keywords = Keyword.all()
    render json: @keywords
  end

  def show
    @keyword = Keyword.find(params[:id])
    render json: @keyword
  end

  def create
    @keyword = Keyword.new(keyword_params)
    print(@keyword)
    
    if @keyword.save
      render json: @keyword
    else
      render json: { error: @keyword.errors }, status: 400
    end
  end

  def update
    @keyword = Keyword.find(params[:id])
    if @keyword
      @keyword.update(keyword_params)
      render json: @keyword
    else
      render json: { error: @keyword.errors }, status: 400
    end
  end

  def destroy
    @keyword = Keyword.find(params[:id])
    if @keyword
      @keyword.destroy
      render json: { message: 'Keyword successfully deleted' }, status: 200
    else
      render json: { error: @keyword.errors }, status: 400
    end
  end

  def keyword_params
    params.require(:keyword).permit(:name, :category_id)
  end
end


