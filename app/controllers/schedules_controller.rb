class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :remark))
    if @schedule.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :schedules
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :remark))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:alert] = "スケジュールを削除しました"
    redirect_to :schedules
  end
end
