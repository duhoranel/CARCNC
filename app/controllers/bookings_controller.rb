class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car_id = params[:car_id]
    if @booking.save!
      redirect_to cars_path
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to cars_path
    else
      render :new
    end
  end

  def index_owner
    @user = current_user
    # cars_owned = @user.cars
    @bookings = Booking.joins(:cars).where(car: { user: current_user })
    # @bookings = cars_owned.map { |car| car.bookings }.flatten
  end

  def index_renter
    @user = current_user
    @bookings = current_user.bookings
  end

  def mark_as_accepted
    @booking.status = "accepted"
    @booking.save
    redirect_to root_path
  end

  def mark_as_rejected
    @booking.status = "rejected"
    @booking.save
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location)
  end
end
