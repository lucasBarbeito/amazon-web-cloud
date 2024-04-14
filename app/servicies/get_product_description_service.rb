# frozen_string_literal: true
require 'nokogiri'
require 'open-uri'

class GetProductDescriptionService

  def self.get_word_frequency(url)
    word_frequency = Hash.new(0)
    product_description = fetch_product_description(url)
    common_words = %w[a the is and of to in on at for with by as from that this it but or not are was were]
    product_description.each do |word|
      next if common_words.include?(word.downcase)
      word_frequency[word.downcase] += 1
    end
    word_frequency
  end

  private

  def self.fetch_product_description(url)
    begin
      html = URI.open(url)
      document = Nokogiri::HTML(html)
      product_description = document.at_css('#productDescription p span').text.downcase.strip
      curated_description = product_description.scan(/\b[\w']+\b/)
      curated_description
    rescue OpenURI::HTTPError => e
      raise SocketError, "Amazon Product not found"
    end
  end
end
