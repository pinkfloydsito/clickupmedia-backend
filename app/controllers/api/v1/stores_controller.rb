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
      render error: { error: 'Unable to create store' }, status: 400
    end
  end

  def update
    @store = Store.find(params[:id])
    if @store
      @store.update(store_params)
      render json: @store
    else
      render error: { error: 'Unable to update store' }, status: 400
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
    params.require(:store).permit(:name)
  end
end


