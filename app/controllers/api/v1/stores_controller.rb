class Api::V1::StoresController < ActionController::API
  def index
    @stores = Store.all()
    render json: @stores
  end

  def show
    @store = Store.find(params[:id])
    render json: @store
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      render json: @store
    else
      render json: { error: @store.errors }, status: 400
    end
  end

  def update
    @store = Store.find(params[:id])
    if @store
      @store.products.clear
      params[:products_attributes].each do |i|
        @store.products << Product.find(i[:id])
      end
      @store.update(store_params)
      @store.save!
      render json: @store
    else
      render json: { error: @store.errors }, status: 400
    end
  end

  def destroy
    @store = Store.find(params[:id])
    if @store
      @store.destroy
      render json: { message: 'Store successfully deleted' }, status: 200
    else
      render error: { error: 'Unable to delete store' }, status: 400
    end
  end

  def store_params
    params.require(:store).permit!
  end
end


