class V1::PurchasesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @purchases = if current_user.admin?
                  Purchase.all
                else
                  current_user.purchases
                end
   
    if @purchases == []
      render json: { message: 'No transactions found' }, status: :not_found
    else
      render json: PurchaseSerializer.new(@purchases).serializable_hash[:data], status: :ok
    end
  end

  def show
    @purchase = Purchase.find_by(id: params[:id])

    if @purchase.nil?
      render status: 404, json: { error: 'Transaction not found' }.to_json
    else
      render json: PurchaseSerializer.new(@purchase).serializable_hash[:data][:attributes], status: :ok
    end
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.total = @purchase.creation.price * @purchase.quantity

    if @purchase.save
      render json: PurchaseSerializer.new(@purchase).serializable_hash[:data][:attributes], status: :created
    else
      render status: 500, json: { error: 'Transaction could not be completed' }.to_json
    end
  end

  def destroy
    purchase = Purchase.find_by(id: params[:id])

    if purchase.nil?
      render status: 404, json: { error: 'Transaction not found' }.to_json
    else
      purchase.destroy
      render json: { message: 'Transaction deleted' }.to_json
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:user_id, :creation_id, :sale, :quantity)
  end
end
