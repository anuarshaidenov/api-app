# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  fullname        :string
#  email           :string
#  password_digest :string
#  gender          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
end
