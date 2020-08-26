class BookingsController < ApplicationController
  def new
    @bookings = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new
    end
  end

  def update
  end

  def index_owner
  end

  def index_renter
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location)
  end
end
