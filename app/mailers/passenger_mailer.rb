class PassengerMailer < ApplicationMailer
  def thank_you(booking = params[:booking])
    @booking = booking
    mail(to: @booking.passengers.first.email, subject: "Thank you")
  end
end
