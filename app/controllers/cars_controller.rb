class CarsController < ApplicationController
  def index
     @cars = Car.all
   end

   def show
     @car = Car.find(params[:id])
   end

   def new
     @car = Car.new
   end

   def create
     @car = Car.new(car_params)
     if @car.save
       redirect_to action: "index"
     end
   end

   def car_params
     params.require(:producer_id).permit(:model, :fuel, :usage, :year)
   end

   def edit
     @car = Car.find(params[:id])
   end

   def update
     @car = Car.find(params[:id])
     if @car.update_attributes(car_params)
       redirect_to action: "index"
     end
   end

   def destroy
     Car.find(params[:id]).destroy
     redirect_to action: "index"
   end
 end
