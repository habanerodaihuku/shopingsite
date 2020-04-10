class FortunesController < ApplicationController
  def index
    @fortune = Fortune.new
  end

  def get_digits(n)
    n.abs.to_s.each_byte.map{|b| b - 0x30}
  end

  def result
    # ニックネームの文字数
    if params[:name].present? && params[:birthday].present? && params[:gender].present? && params[:like].present?
      name_math = params[:name].length

      # 入力された文字列から"-"を除外して数値化
      birthday_i = params[:birthday].delete("-")
      # 数値化した誕生日を1桁ずつ配列に入れる
      birthday_array = birthday_i.chars.map(&:to_i)
      # 配列の値を全て足す
      birthday_math = birthday_array.inject(:*)

      # 性別の文字数
      gender_math = params[:gender].length

      # 好きな物の文字数
      like_math = params[:like].length

      # 当日の日付を取得
      require 'date'
      date = Date.today.to_time
      # 当日の日付を1桁ずつ足す
      date_math = date.to_s.slice(0..9).delete("-").chars.map(&:to_i).inject(:+)

      result = name_math + birthday_math + gender_math + like_math + date_math

      if result % 27 == 0
        @fortune_image = "/omikuzi_image/omikuji_daikyou.png"
      elsif result % 23 == 0
        @fortune_image = "/omikuzi_image/omikuji_kyou.png"
      elsif result % 7 == 0
        @fortune_image = "/omikuzi_image/omikuji_daikichi.png"
      elsif result % 6 == 0
        @fortune_image = "/omikuzi_image/omikuji_kichi.png"
      elsif result % 5 == 0
        @fortune_image = "/omikuzi_image/omikuji_chuukichi.png"
      elsif result % 4 == 0
        @fortune_image = "/omikuzi_image/omikuji_suekichi.png"
      elsif result % 3 == 0
        @fortune_image = "/omikuzi_image/omikuji_syoukichi.png"
      else
        @fortune_image = "/omikuzi_image/omikuji_daikichi.png"
      end

    else
      flash[:notice] = "全ての項目を入力してください"
      redirect_to("/")
    end

  end

  private

  def fortune_params_result
    params.require(:controller).permit(:name, :brthday, :gender, :like)
  end
  
end
