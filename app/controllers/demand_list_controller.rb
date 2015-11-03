class DemandListController < ApplicationController
  def index
  end

  def import_csv_new
  end

  def import_csv
    respond_to do |format|
      if DemandList.import_csv(params[:csv_file])
        format.html { redirect_to home_index_path }
        format.json { head :no_content }
      else
        format.html { redirect_to home_index_path, :notice => "CSVファイルの読み込みに失敗しました。" }
        format.json { head :no_content }
      end
    end
  end
end
