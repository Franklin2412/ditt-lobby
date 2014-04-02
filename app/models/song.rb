class Song < ActiveRecord::Base
  has_and_belongs_to_many :fellows
  has_many :comments
end
