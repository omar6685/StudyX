# app/controllers/spree/checkout_controller_decorator.rb
Spree::CheckoutsController.class_eval do
    def update
      if @order.update_from_params(params, permitted_checkout_attributes, request.headers.env)
        if @order.next
          # Set the payment method to the default payment method (e.g. Check)
          payment_method = Spree::PaymentMethod::Check.first
          @order.payments.create!(payment_method: payment_method)
  
          render json: { success: true }
        else
          render json: { success: false, errors: @order.errors.full_messages }
        end
      else
        render json: { success: false, errors: @order.errors.full_messages }
      end
    end
  end
  