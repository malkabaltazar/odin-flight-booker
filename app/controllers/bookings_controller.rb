class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight])
    @booking = Booking.new
    params[:passenger_count].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)
    PassengerMailer.with(booking: @booking).thank_you.deliver_now
    redirect_to @booking
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes:
                                                  [:name, :email])
    end
end
