class ReportsController < ApplicationController
  def sales_report
    if params[:start_date].present? and params[:end_date].present?
      @start_date = params[:start_date]
      @end_date = params[:end_date]
    else
      @start_date = Date.today
      @end_date = Date.today
    end
    date_range = (@start_date..@end_date).to_a
    @orders = Order.joins(:order_items).where("date IN (?)", date_range).distinct(:order_id)

    if params[:download].present?
      pdf = render_to_string pdf: "sales_report", layout: 'pdf', template: "reports/sales_report_pdf.html.erb", encoding: "UTF-8"
      save_path = Rails.root.join('reports',"sales_report.pdf")
      File.open(save_path, 'wb') do |file|
        file << pdf
      end
      path = "#{Rails.root}/reports/sales_report.pdf"
      send_file(path, disposition: 'attachment')
    end
  end
end
