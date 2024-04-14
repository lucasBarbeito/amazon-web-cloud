class AmazonProduct < ApplicationRecord

  validates_uniqueness_of :url


end
