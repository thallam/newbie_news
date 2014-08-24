class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }
  scope :order_by_title, -> {order('title: DESC')}
  scope :order_by_earliest, -> {order('created_at ASC')}

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
  end
  def down_votes
    votes.where(value: -1).count
  end
  def points
    votes.sum(:value)
  end
end
