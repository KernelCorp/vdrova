class OrdersController < InheritedResources::Base
  respond_to :json
  actions :create

  private

  def order_params
    params.require(:order).permit :username, :phone, :text
  end
end
