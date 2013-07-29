class TalksController < ApplicationController
before_filter :find_talk, :only => [:show, :edit, :update, :destroy]

  def index
    @talks = Talk.all
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(params[:talk])
    if @talk.save
      flash[:notice] = "Talk has been created."
      redirect_to @talk
    else
      flash[:alert] = "Talk has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @talk.update_attributes(params[:talk])
      flash[:notice] = "Talk has been updated."
      redirect_to @talk
    else
      flash[:alert] = "Talk has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @talk.destroy
    flash[:notice] = "Talk has been deleted."
    redirect_to talks_path
  end

private
  def find_talk
    @talk = Talk.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The talk you were looking for could not be found."
      redirect_to talks_path
  end

end
