class OrdersController < ApplicationController
  before_action :skip_authorization, only: :create
  before_action :skip_policy_scope, only: :create

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end

  def create
    @bib = Bib.find(params[:bib_id])
    # authorize @order
    order = Order.create!(bib: @bib, bib_sku: @bib.sku, amount: @bib.price, state: 'en attente de paiement', user: current_user)
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @bib.race.name,
        amount: @bib.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )
    order.update(checkout_session_id: session.id)
    @bib.update(available: "2")
    redirect_to new_order_payment_path(order)
  end
end
