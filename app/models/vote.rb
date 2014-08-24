class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

# TODO This line creates an error and not sure why
validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote"}
end
