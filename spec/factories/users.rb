FactoryGirl.define do
  factory :user, class: User do
    sequence(:email, 1) { |n| "email#{n}@domain#{n}.com" }
    password_digest "ftyasgudijsad"
  end
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
