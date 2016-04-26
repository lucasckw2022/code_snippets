class Kind < ActiveRecord::Base
  has_many :codes, dependent: :nullify
end
