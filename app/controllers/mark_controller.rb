class MarkController < ApplicationController
  def create
    @Report = Report.find(params[:Report_id])
    @mark = @Report.marks.create(mark_params)
    redirect_to Report_path(@Report)
  end

  def destroy
    @Report = Report.find(params[:Report_id])
    @mark = @Report.marks.find(params[:id])
    @mark.destroy
    redirect_to Report_path(@Report)
  end

  private def mark_params
      params.require(:mark).permit(:points)
  end
end