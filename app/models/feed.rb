class Feed < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates :text, presence: true, length: { maximum: 200 }
end
