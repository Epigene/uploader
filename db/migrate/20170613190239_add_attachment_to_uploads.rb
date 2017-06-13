class AddAttachmentToUploads < ActiveRecord::Migration[5.1]
  def up
    add_attachment :uploads, :file
  end

  def down
    remove_attachment :uploads, :file
  end
end
