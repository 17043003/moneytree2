class BudgetsController < ApplicationController
  before_action :login_required

  def index
    @budgets = []
    users_budgets = current_user.budgets

    @categories = Category.all
    p @categories

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
    @categories = Category.all
    @budgets = []

    @categories.each do |category|
      if budget = Budget.find_by(spent_at: params[:date], user_id: current_user.id, category_id: category.id)
        @budgets << budget
      else
        @budgets << Budget.new(spent_at: params[:date], user_id: current_user.id, category_id: category.id)
      end
    end
  end


  def create
    @budgets = []
    save_flag = false
    @budget = Budget.new

    budget_params.each do |param|
      if !param[:amount].empty?
        # レコードが登録されていなければ新規に保存する
        if !Budget.find_by(spent_at: param[:spent_at], user_id: current_user.id, category_id: param[:category_id])
          param[:user_id] = current_user.id

          if Budget.new(param).save!
            save_flag = true
          end
        # レコードが登録されている場合、DB内のデータを更新する
        else
          param[:user_id] = current_user.id
          @budget = Budget.find_by(spent_at: param[:spent_at], user_id: current_user.id, category_id: param[:category_id])
          p "object:#{@budget}"
          @budget.assign_attributes(param)
          if @budget.save!
            save_flag = true
          end
        end
      end
    end
    if save_flag
      redirect_to [current_user, :budgets], notice: "収支を保存しました"
    else
      redirect_to [current_user, :budgets]
    end
  end


  private def budget_params
    params.require(:budgets).keys.map do |key|
      params.require(:budgets)["#{key}"].permit(:spent_at, :amount, :category_id)
    end

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
