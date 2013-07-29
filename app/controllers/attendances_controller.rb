class AttendancesController < ApplicationController
  before_filter :find_talks_and_attendees, only: [:new, :create]

  def new
    if @attendees.size == 0
      flash[:alert] = "There are not attendees to be added to talks."
      redirect_to attendees_path
    else
      @attendance = Attendance.new
    end
  end

  def create
    @attendance = Attendance.new(params[:attendance])
    if @attendance.save
      flash[:notice] = "Attendance has been created."
      redirect_to @attendance.talk
    else
      flash[:alert] = "Attendance has not been created."
      redirect_to talks_path
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    flash[:notice] = "Talk attendance has been deleted."
    redirect_to talks_path
  end

private
  def find_talks_and_attendees
    @talks = Talk.all
    @attendees = Attendee.all
  end
end
