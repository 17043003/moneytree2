class BudgetsController < ApplicationController
  before_action :login_required

  def index
    @budgets = Budget.all
  end

  def show
  end

  def new
  end

  def edit
    @budget = Budget.find(params[:id])
  end
end
