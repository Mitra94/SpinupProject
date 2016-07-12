class Opinion < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :micropost_id, presence: true 
   
  has_many :passive_spins, class_name:  "Spin",
                                   foreign_key: "spined_id",
                                   dependent:   :destroy

  has_many :spiners, through: :passive_spins, source: :spiner
  
  has_many :notifications
end
