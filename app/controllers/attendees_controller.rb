class AttendeesController < ApplicationController
before_filter :find_attendee, :only => [:show, :edit, :update, :destroy]

  def index
    @attendees = Attendee.all
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(params[:attendee])
    if @attendee.save
      flash[:notice] = "Attendee has been created."
      redirect_to @attendee
    else
      flash[:alert] = "Attendee has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @attendee.update_attributes(params[:attendee])
      flash[:notice] = "Attendee has been updated."
      redirect_to @attendee
    else
      flash[:alert] = "Attendee has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @attendee.destroy
    flash[:notice] = "Attendee has been deleted."
    redirect_to attendees_path
  end

private
  def find_attendee
    @attendee = Attendee.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The attendee you were looking for could not be found."
      redirect_to attendees_path
  end
end
