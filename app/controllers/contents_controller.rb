class ContentsController < ApplicationController
  before_action :plan_find_params, only: [ :index, :create]
  before_action :move_to_index, only: [ :index]

  def index
    @content = Content.new
    @contents = @plan.contents.includes(:user)
  end

  def create
    @content = @plan.contents.new(contents_params)
    if @content.save
      redirect_to plan_contents_path(@plan), method: :get
    else
      @contents = @plan.contents.includes(:user)
      render :index
    end
  end

  private

  def contents_params
    params.require(:content).permit(:to_do).merge(user_id: current_user.id)
  end

 def plan_find_params
  @plan = Plan.find(params[:plan_id])
 end

  def move_to_index
    redirect_to root_path if @plan.plan_user_ids != current_user.id
  end
end
