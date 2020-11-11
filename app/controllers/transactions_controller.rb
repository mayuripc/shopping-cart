class TransactionsController < ApplicationController

  before_action :check_cart!

  def new
    render :new
  end

  def create
  
      flash[:alert] = "Hmm, something went wrong, let's try again!"
    
  end


  private

    def check_cart!
      if current_user.get_cart_products_with_qty.blank?
        redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
      end
    end

    #def generate_client_token
     # Braintree::ClientToken.generate
    #end

end
