class Order < ActiveRecord::Base
  has_many :reservations
  belongs_to :user
  validates :user_id, presence: true

  enum status: %w(ordered paid completed cancelled)
end
