class Micropost < ActiveRecord::Base
  belongs_to :developer
  belongs_to :app
  
  default_scope -> { order(created_at: :desc) }
  validates :developer_id, presence: true
  validates :app_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
