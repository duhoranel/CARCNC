class CarsController < ApplicationController
  def index
    @location = params[:location]
    @start_date = params[:start_date][:date_input_name]
    @end_date = params[:end_date][:date_input_name]
    @cars = Car.all
  end

  def show
    @booking = Booking.new
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to root_path(@car)
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:model, :capacity, :price, :photo)
  end
end
