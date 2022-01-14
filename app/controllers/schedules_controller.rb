class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  
  def new
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  def create
    @schedules = Schedule.all
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :schedules
    else
      render "new", :schedules => Schedule.all
    end
  end

  def show
    @schedules = Schedule.all
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedules = Schedule.all
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "スケジュールの更新に成功しました"
      redirect_to :schedules
    else
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールの削除に成功しました"
    redirect_to :schedules
  end
end
