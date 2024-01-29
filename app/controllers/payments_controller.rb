
class PaymentsController < ApplicationController
    include PayPal::SDK::REST
  
    def create_payment
        payment = Payment.new(payment_params)
    
        if payment.create
          # Save the payment ID in your database
          payment_link = payment.links.find { |link| link.method == 'REDIRECT' }.href
    
          # Render a JavaScript response to perform the redirect on the client side
          render js: "window.location.href = '#{payment_link}';"
        else
          flash[:alert] = 'Failed to create PayPal payment'
          redirect_to dashboard_path
        end
      end
  
    def execute_payment
      payment = Payment.find(params[:paymentId])
  
      if payment.execute(payer_id: params[:PayerID])
        # Handle successful payment execution
        flash[:notice] = 'Payment executed successfully'
      else
        flash[:alert] = 'Failed to execute PayPal payment'
      end
  
      redirect_to dashboard_path
    end
  
    private
  
    def payment_params
      {
        intent: 'sale',
        payer: { payment_method: 'paypal' },
        redirect_urls: {
          return_url: execute_payment_url,
          cancel_url: root_url
        },
        transactions: [{
          item_list: {
            items: [{
              name: 'Product Name',
              price: '10.00',
              currency: 'USD',
              quantity: 1
            }]
          },
          amount: {
            total: '10.00',
            currency: 'USD'
          },
          description: 'Description of the payment'
        }]
      }
    end
  end
  