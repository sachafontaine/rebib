class PaymentsController < ApplicationController
  skip_after_action :verify_authorized, only: [:new]
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
