class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  default_scope { order('created_at DESC') }
  scope :order_by_title, -> {order('title: DESC')}
  scope :order_by_earliest, -> {order('created_at ASC')}

end
