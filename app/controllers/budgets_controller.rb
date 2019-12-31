class BudgetsController < ApplicationController
  before_action :login_required

  def index
    @budgets = []
    users_budgets = current_user.budgets

    @categories = Category.all

    year = params["display_date(1i)"]&.to_i # 日付の範囲設定で使用するためto_iで数値にする
    month = params["display_date(2i)"]&.to_i

    # 最初に現在の年,月を表示する
    if year == nil && month == nil
      year = Time.now.year
      month = Time.now.month
    end

    @selected_date = Time.new(year, month, 1) # indexの見出し,日付プルダウンのデフォルト値に使用する

    # 月ごとの日数を取得
    @end_of_month = get_end_of_month(year, month)
    @display_date_range = (Date.new(year, month, 1)..Date.new(year, month, @end_of_month))

    @budgets = users_budgets.where(spent_at: @display_date_range).order(:spent_at)

  end

  def show
  end

  def new
    @budget = Budget.new(spent_at: params[:date], user_id: current_user)
  end

  def edit
    @budget = current_user.budgets.find(params[:id])
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.user = current_user
    if @budget.save
      redirect_to [@budget.user, @budget], notice: "保存しました"
    else
      render "new"
    end
  end

  def update
    @budget = Budget.find(params[:id])
    @budget.assign_attributes(budget_params)
    if @budget.save
      redirect_to [current_user, @budget], notice: "収支を登録しました"
    else
      flash[:notice] = "更新失敗"
      render "edit"
    end
  end

  private def budget_params
    params.require(:budget).permit(
      :spent_at,
      :amount,
      :user_id
    )
  end

  private def get_end_of_month(year, month)
    # 表示する日付の範囲を設定
    if [1, 3, 5, 7, 8, 10, 12].include?(month)
      day = 31
    elsif [4, 6, 9, 11].include?(month)
      day = 30 # 4,6,9,11月
    else
      if year%4 != 0
        day = 28
      elsif year%4 == 0 # うるう年
        day = 29
      end
    end
  end

end
