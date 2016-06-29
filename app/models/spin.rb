class Spin < ActiveRecord::Base
  belongs_to :spiner, class_name: "User"
  belongs_to :spined, class_name: "Opinion"
  
  validates :spiner_id, presence: true
  validates :spined_id, presence: true
end
