class Stripe::WebhooksController < ApplicationController
    def create
            # Replace this endpoint secret with your endpoint's unique secret
            # If you are testing with the CLI, find the secret by running 'stripe listen'
            # If you are using an endpoint defined with the API or dashboard, look in your webhook settings
            # at https://dashboard.stripe.com/webhooks
            webhook_secret = 'whsec_12345'
            payload = request.body.read
            if !webhook_secret.empty?
              # Retrieve the event by verifying the signature using the raw body and secret if webhook signing is configured.
              sig_header = request.env['HTTP_STRIPE_SIGNATURE']
              event = nil
          
              begin
                event = Stripe::Webhook.construct_event(
                  payload, sig_header, webhook_secret
                )
              rescue JSON::ParserError => e
                # Invalid payload
                status 400
                return
              rescue Stripe::SignatureVerificationError => e
                # Invalid signature
                puts '⚠️  Webhook signature verification failed.'
                status 400
                return
              end
            else
              data = JSON.parse(payload, symbolize_names: true)
              event = Stripe::Event.construct_from(data)
            end
            # Get the type of webhook event sent - used to check the status of PaymentIntents.
            event_type = event['type']
            data = event['data']
            data_object = data['object']
          
            if event.type == 'customer.subscription.deleted'
              # handle subscription canceled automatically based
              # upon your subscription settings. Or if the user cancels it.
              # puts data_object
              puts "Subscription canceled: #{event.id}"
            end
          
            if event.type == 'customer.subscription.updated'
              # handle subscription updated
              # puts data_object
              puts "Subscription updated: #{event.id}"
            end
          
            if event.type == 'customer.subscription.created'
              # handle subscription created
              # puts data_object
              puts "Subscription created: #{event.id}"
            end
          
            if event.type == 'customer.subscription.trial_will_end'
              # handle subscription trial ending
              # puts data_object
              puts "Subscription trial will end: #{event.id}"
            end
          
            content_type 'application/json'
            {
              status: 'success'
            }.to_json 
    end
end