class CarsController < ApplicationController
  def index
    @cars = Car.all
  end
  def show
    @car = Car.find(params[:id])
  end
  def def new
    @car = Car.new
  end
  def create
    @car = Car.new(car_params)
    @car.save!
    redirect_to root_path(@car)
  end

  private

  def car_params
    params.require(:car).permit(:model, :capacity, :availability, :price)
  end

end