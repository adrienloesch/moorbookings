class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @mooring = Mooring.find(params[:mooring_id])
    @booking.mooring = @mooring
    @booking.user = current_user
    if @booking.save
      sleep(2.5)
      redirect_to dashboard_path
    else
      render "moorings/show"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # raise
    @booking.update(booking_params)
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
