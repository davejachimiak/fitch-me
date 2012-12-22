class Picture < ActiveRecord::Base
  attr_accessible :url

  validates :url, presence: true
  validates :url, uniqueness: true

  def self.random
    order('random()').first
  end
end
