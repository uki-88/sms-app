class ContentsController < ApplicationController
  def index
    @content = Content.new
    @plan = Plan.find(params[:plan_id])
  end

  def create
    @plan = Plan.find(params[:plan_id])
    @content = @plan.contents.new(contents_params)
    if @content.save
      redirect_to plan_contents_path(@plan), method: :get
    else
      render :index
    end
  end

  private

  def contents_params
    params.require(:content).permit(:to_do).merge(user_id: current_user.id)
  end
end
