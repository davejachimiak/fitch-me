class Picture < ActiveRecord::Base
  attr_accessible :url

  validates :url, presence: true
  validates :url, uniqueness: true
end
