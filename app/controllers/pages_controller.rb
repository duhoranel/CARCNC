class PagesController < ApplicationController
   def home
      
    @booking = Booking.new
   end
   
   def navbar
   end
end
