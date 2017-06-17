class UploadsController < ApplicationController

  # GET uploads_path | /files
  def index
    uploads = current_user.uploads.page(params[:page]).per(10)
    uploads_size = current_user.uploads.size
    render "uploads/index", locals: {uploads: uploads, uploads_size: uploads_size}
  end

  # GET new_upload_path | /files/new
  def new
    upload = Upload.new
    render "uploads/new", locals: {upload: upload}
  end

  # POST uploads_path | /files
  def create
    upload = Upload.new(user_id: current_user.id)

    begin
      upload_params
    rescue
      recover_from_bad_upload(upload)
    end

    return if performed?

    if upload.update(upload_params)
      redirect_to uploads_path, flash: {notice: "#{upload.file_file_name} added!"}
    else
      recover_from_bad_upload(upload)
    end
  end

  # GET upload_path | /files/:id
  def show
    upload = authorize_user_for_upload_resource
    return if performed?

    file_path = upload.file.path
    options = {
      filename: upload.file_file_name,
      type: upload.file_content_type,
      disposition: :attachment
    }

    send_file(file_path, options)
  end

  # DELETE upload_path | /files/:id
  def destroy
    upload = authorize_user_for_upload_resource
    return if performed?

    file_name = upload.file_file_name
    upload.destroy
    redirect_to uploads_path, flash: {notice: "#{file_name} deleted!"}
  end

  private
    def upload_params
      @upload_params ||= params.require(:upload).permit(:file)
    end

    def recover_from_bad_upload(upload)
      flash.now.alert = "Oops, there's errors!"
      render :new, locals: {upload: upload}
    end

    def authorize_user_for_upload_resource
      resource = Upload.find_by(id: params[:id])

      redirect_to root_path, flash: {alert: "Sorry, that file no longer exists!"} and return if resource.blank?

      redirect_to root_path, flash: {alert: "Sorry, that file does not belong to you!"} and return if resource.user_id != current_user.id

      resource
    end

end
