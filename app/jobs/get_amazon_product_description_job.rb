# frozen_string_literal: true

class GetAmazonProductDescriptionJob < ApplicationJob
  queue_as :default

  def perform(amazon_product_id)
    amazon_product = AmazonProduct.find(amazon_product_id)
    if amazon_product
      word_frequency = GetProductDescriptionService.get_word_frequency(amazon_product.url)
      amazon_product.update(word_frequency: word_frequency)
    end
  end

end
