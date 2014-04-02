class Comment < ActiveRecord::Base
  belongs_to :fellow
  belongs_to :song
end
