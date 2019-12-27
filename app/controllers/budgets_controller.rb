class BudgetsController < ApplicationController
  before_action :login_required

  def index
    # @budgets = Budget.all
    searched_date = Date.today
    @budgets = Budget.where(spent_at: searched_date.in_time_zone.all_month).order(:spent_at)
  end

  def show
  end

  def new
  end

  def edit
    @budget = Budget.find(params[:id])
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      redirect_to @budget, notice: "保存しました"
    else
      render "new"
    end
  end

  def update
    @budget = Budget.find(params[:id])
    @budget.assign_attributes(budget_params)
    if @budget.save
      redirect_to @budget, notice: "収支を登録しました"
    else
      flash[:notice] = "更新失敗"
      render "edit"
    end
  end

  private def budget_params
    params.require(:budget).permit(
      :spent_at,
      :amount
    )
  end

end
