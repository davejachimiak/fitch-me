class Picture < ActiveRecord::Base
  validates :url, presence: true
  attr_accessible :url
end
