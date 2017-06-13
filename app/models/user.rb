class User < ApplicationRecord
  # users.password_hash in the database is a :string
  has_secure_password

  has_many :uploads, dependent: :destroy

  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: %r'\A.+?\@.+?\..+?'}
end

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :text             not null
#  password_digest :text             not null
#
# Indexes
#
#  index_users_on_created_at  (created_at)
#  index_users_on_email       (email) UNIQUE
#
