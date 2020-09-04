class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    if @booking.save!
      redirect_to car_booking_confirmation_path(@booking)
    else
      render "cars/show"
    end
  end

  def update
    if @booking.update
      redirect_to car_booking_confirmation_path(@booking)
    else
      render :new
    end
  end

  def dashboard
    @bookings = Booking.all
    @other_people_requests = Booking.joins(:cars).where(car: { user: current_user })
    @my_pending_requests = current_user.bookings
    # @bookings = cars_owned.map { |car| car.bookings }.flatten
  end

  def confirmation
    @booking = Booking.find(params[:booking_id])
  end

  def accept
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: true)
    redirect_to root_path
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: false)
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id)
  end
end
