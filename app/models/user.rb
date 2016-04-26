class User < ActiveRecord::Base
  has_many :codes, dependent: :nullify
  has_secure_password
end
