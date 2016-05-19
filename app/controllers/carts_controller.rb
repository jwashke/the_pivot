class CartsController < ApplicationController

  def create
    session[:checkin] = nil
    session[:checkout] = nil
    checkin = params[:date][:checkin_date]
    checkout = params[:date][:checkout_date]
    if checkin == "" || checkout == ""
      flash[:error] = "You must have a checkin and checkout date"
    else
      reserved_dates = Reservation.dates_reserved(
        params[:id], checkin, checkout
      )
      if Date.strptime(checkin, "%m/%d/%Y") > Date.strptime(checkout, "%m/%d/%Y")
        flash[:error] = "You must select a checkin date before your checkout date"
      elsif reserved_dates.empty?
        @cart.add_home(params[:id], checkin, checkout)
        session[:cart] = @cart.contents
        flash[:success] = "You've added this reservation to your cart"
      else
        flash[:error] = "This home is already reserved on #{reserved_dates.join(", ")}"
      end
    end
    redirect_to request.referrer
  end

  def destroy
    @cart.remove_home(params["home_id"], params["checkin"], params["checkout"])
    redirect_to request.referrer
  end

  def show
    @contents = @cart.reservations
  end

end
