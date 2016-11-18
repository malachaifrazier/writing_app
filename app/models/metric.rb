class Metric < ActiveRecord::Base
  has_many :goals
  validates_uniqueness_of :name
end
