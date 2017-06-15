require 'wicked_pdf'

class ReportController < ApplicationController
  helper_method :report_start_date, :report_end_date

  # GET new_report_path | /report/new
  def new
    render "report/new"
  end

  # GET report_path | /report
  def show
    request.format = params[:format] if params[:format].present?

    redirect_to new_report_path, flash: {alert: "Please, specify both start and end"} and return if (params[:report_start_date].blank? || params[:report_end_date].blank?)

    redirect_to new_report_path, flash: {alert: "Please, specify a start date before end date"} and return if (report_start_date > report_end_date)

    uploads = current_user.uploads.where(
      created_at: report_start_date.beginning_of_day..report_end_date.end_of_day
    )

    respond_to do |format|
      # serve PDF
      format.pdf do
        html = render_to_string("report/show", locals: {uploads: uploads})
        pdf = WickedPdf.new.pdf_from_string(html)

        path = Tempfile.new([SecureRandom.uuid, ".pdf"]).path

        File.open(path, "wb") { |file| file << pdf }

        file_path = path # file.path
        file_name = "Upload Report #{current_user.email}, #{report_start_date}-#{report_end_date}.pdf"

        options = {
          filename: file_name,
          type: "application/pdf",
          disposition: :attachment
        }

        send_file(file_path, options)
      end

      # Serve normal HTML
      format.all do
        render "report/show", locals: {uploads: uploads}
      end
    end
  end

  private
    def forwardable_params
      params.permit(:report_start_date, :report_end_date)
    end

    def report_start_date
      params[:report_start_date].to_date
    end

    def report_end_date
      params[:report_end_date].to_date
    end

end
