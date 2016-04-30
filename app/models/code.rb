class Code < ActiveRecord::Base
  belongs_to :kind
  belongs_to :user

  validates :title, presence: true
  validates :work, presence: true
  validates :kind, presence: true
end
