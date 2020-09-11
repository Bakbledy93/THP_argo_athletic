class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :user_id, presence: true
  
  # grap only the last 20 messages
  def self.most_recent
    order(:created_at).last(20)
  end
end