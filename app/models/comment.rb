class Comment < ActiveRecord::Base
  belongs_to :developer
  belongs_to :micropost
end
