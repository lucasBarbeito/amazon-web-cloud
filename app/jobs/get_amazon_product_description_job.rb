# frozen_string_literal: true

class GetAmazonProductDescriptionJob < ApplicationJob
  queue_as :default

  def perform(amazon_product_id)
    amazon_product = AmazonProduct.find(amazon_product_id)
    if amazon_product
      url = amazon_product.url
      begin
        word_frequency = GetProductDescriptionService.get_word_frequency(url)
        amazon_product.update!(word_frequency: word_frequency)
      rescue StandardError => e
        Rails.logger.error("Error occurred while fetching word frequency: #{e.message}")
        amazon_product.destroy
      end
    end
  end
end
