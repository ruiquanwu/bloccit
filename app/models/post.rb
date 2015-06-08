class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  #default_scope { order('created_at DESC') }
  # define scope
  scope :ordered_by_title, -> { order('title ASC') }
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
end
