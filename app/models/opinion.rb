class Opinion < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  
  has_many :passive_spins, class_name:  "Spin",
                                   foreign_key: "spined_id",
                                   dependent:   :destroy

  has_many :spiners, through: :passive_spins, source: :spiner
end
