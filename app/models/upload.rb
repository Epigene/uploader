class Upload < ApplicationRecord
  belongs_to :user

  has_attached_file :file

  validates :user_id, :user, presence: true
  validates_attachment_content_type :file, content_type: %r'.*'
end

# == Schema Information
#
# Table name: uploads
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer          not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#
# Indexes
#
#  index_uploads_on_created_at  (created_at)
#  index_uploads_on_user_id     (user_id)
#
