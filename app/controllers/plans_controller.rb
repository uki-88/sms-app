class PlansController < ApplicationController
before_action :move_to_index, only: [ :destroy]

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to root_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :start_time, :end_time, user_ids: [])
  end

  def move_to_index
    redirect_to root_path if @plan.user_id != current_user.id
  end

end
