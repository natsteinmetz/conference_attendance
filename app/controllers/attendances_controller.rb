class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(params[:attendance])
    if @attendance.save
      flash[:notice] = "Attendance has been created."
      redirect_to @talk
    else
      flash[:alert] = "Attendance has not been created."
      render :action => "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
