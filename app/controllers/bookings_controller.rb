class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @session = Session.find(params[:session_id])
    @booking = Booking.new
    @booking.session = @session
    @booking.user = current_user
  end

  def create
    @session = Session.find(params[:session_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.session = @session
    if @booking.save
      redirect_to session_confirmation_path(@session, @booking), notice: 'Votre session est réservée.'
    else
      render :new, alert: "Votre session n'a pas pu être réservée."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirmation
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :session)
  end
end
