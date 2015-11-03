# csv操作を可能にするライブラリ
require 'csv'
# 文字コード操作をおこなうライブラリ(nkfの方がいいかも)
require 'kconv'

class DemandList < ActiveRecord::Base
  # CSVファイルを読み込み、ユーザーを登録する
  def self.import_csv(csv_file)
    # csvファイルを受け取って文字列にする
    csv_text = csv_file.read

    data = []

    #文字列をUTF-8に変換
    CSV.parse(Kconv.toutf8(csv_text)) do |row|

      demand_list = DemandList.new
      demand_list.customer_name = row[0]  #csvの2列目を格納
      demand_list.address_1 = row[1]
      demand_list.address_2 = row[2]
      demand_list.estate_type = row[3]
      demand_list.price = row[4]
      demand_list.wayside = row[5]
      demand_list.station  = row[6]
      demand_list.walking_time = row[7]
      demand_list.land_area = row[8]
      demand_list.building_area = row[9]
      demand_list.exclusive_area = row[10]

      demand_list.save
    end
  end
end
