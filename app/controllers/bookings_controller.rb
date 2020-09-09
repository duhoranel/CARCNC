class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    booking_params
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
<<<<<<< HEAD
      if @booking.save!
        redirect_to car_booking_confirmation_path(@booking)
      else
        render "cars/show"
      end
  end

  def update
    if @booking.update
      redirect_to car_booking_confirmation_path(@booking)
=======
    if @booking.save!
      redirect_to car_booking_confirmation_path(@booking.car, @booking)
    else
      render "cars/show"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to car_booking_confirmation_path(@booking.car, @booking)
>>>>>>> master
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @car = @booking.car
  end

  def dashboard
    @other_people_requests = Booking.joins(:car).where(cars: { user: current_user })
    @my_pending_requests = Booking.where(user: current_user)
    # @bookings = cars_owned.map { |car| car.bookings }.flatten
  end

  def confirmation
    @booking = Booking.find(params[:booking_id])
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: true)
<<<<<<< HEAD
    redirect_to root_path
=======
    redirect_to bookings_dashboard_path
>>>>>>> master
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update(status: false)
<<<<<<< HEAD
    redirect_to root_path
=======
    redirect_to bookings_dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_dashboard_path
>>>>>>> master
  end

  private

  def booking_params
<<<<<<< HEAD
    params.permit(:car_id)
=======
    params.require(:booking).permit(:start_date, :end_date, :car_id)
>>>>>>> master
  end
end
