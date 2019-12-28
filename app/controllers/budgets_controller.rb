class BudgetsController < ApplicationController
  before_action :login_required

  def index
    @budgets = []
    year = params["display_date(1i)"]&.to_i # 日付の範囲設定で使用するためto_iで数値にする
    month = params["display_date(2i)"]&.to_i

    # 最初に現在の年,月を表示する
    if year == nil && month == nil
      year = Time.now.year
      month = Time.now.month
      @selected_date = Time.new(year, month, 1) # indexの見出し,日付プルダウンのデフォルト値に使用する
    else
      @selected_date = Time.new(year, month, 1)
    end

    # 表示する日付の範囲を設定
    if [1, 3, 5, 7, 8, 10, 12].include?(month)
      display_day_range = (1..31)
    elsif month == 2
      display_day_range = (1..28) if year%4 != 0
      display_day_range = (1..29) if year%4 == 0 # うるう年
    else
      display_day_range = (1..30) # 4,6,9,11月
    end

    # データベースに存在しない日付も配列に入れる
    display_day_range.each do |day| 
      if Budget.find_by(spent_at: Time.new(year, month, day))
        @budgets.push(Budget.find_by(spent_at: Time.new(year, month, day)))
      else
        @budgets.push(Budget.new(spent_at: Time.new(year, month, day), amount: 0))
      end
    end
  end

  def show
  end

  def new
    @budget = Budget.new(spent_at: params[:date])
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
