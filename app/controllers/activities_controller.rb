class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:query].blank?
      @activities = Activity.all
    elsif params[:category].present?
      @activities = Activity.joins(:course).where("courses.category = ?", params[:category])
    else
      @activities = Activity.global_search(params[:query])
    end
    today = Date.today-5
    @activitiesdayone = @activities.where(start_time: today.beginning_of_day..today.end_of_day)
    @activitiesdaytwo = @activities.where(start_time: (today + 1).beginning_of_day..(today + 1).end_of_day)
    @activitiesdaythree = @activities.where(start_time: (today + 2).beginning_of_day..(today + 2).end_of_day)
    @activitiesdayfour = @activities.where(start_time: (today + 3).beginning_of_day..(today + 3).end_of_day)
    @activitiesdayfive = @activities.where(start_time: (today + 4).beginning_of_day..(today + 4).end_of_day)
    @activitiesdaysix = @activities.where(start_time: (today + 5).beginning_of_day..(today + 5).end_of_day)
    @activitiesdayseven = @activities.where(start_time: (today + 6).beginning_of_day..(today + 6).end_of_day)

  end

  def show
    @activity = Activity.find(params[:id])
    @course = @activity.course
    @markers =
      [{
        lng: @course.longitude,
        lat: @course.latitude
      }]
  end

  def create
  end

  def new
  end

  def destroy
  end

  def update
  end

  def edit
  end
end
