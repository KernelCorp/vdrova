class OrdersController < InheritedResources::Base
  respond_to :json
  actions :create

  def new
    render 'new', layout: 'ordinary_cms/application'
  end

  private

  def order_params
    params.require(:order).permit :username, :phone, :text
  end
end
