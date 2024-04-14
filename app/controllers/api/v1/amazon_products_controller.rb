# frozen_string_literal: true

class Api::V1::AmazonProductsController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    @amazon_products = AmazonProduct.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @amazon_products, status: :ok }
    end
  end

  def show
    begin
      @amazon_product = AmazonProduct.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @amazon_product, status: :ok }
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'AmazonProduct not found' }, status: :not_found
    end
  end

  def create
    begin
      amazon_url = params.dig("amazon_url")
      validate_url(amazon_url)
      @amazon_product = AmazonProduct.find_by(url: amazon_url)
      if @amazon_product
        respond_to do |format|
          format.html { redirect_to api_v1_amazon_product_path(@amazon_product.id)}
          format.json { render json: @amazon_product, status: :ok }
        end
      else
        word_frequency = GetProductDescriptionService.get_word_frequency(amazon_url)
        @amazon_product = AmazonProduct.new(url: amazon_url, word_frequency: word_frequency)
        if @amazon_product.save
          respond_to do |format|
            format.html { redirect_to api_v1_amazon_product_path(@amazon_product.id)}
            format.json { render json: @amazon_product, status: :created }
          end
        else
          respond_to do |format|
            format.html { redirect_to root_path, notice: "Amazon Product wasn't saved" }
            format.json { render json: { error: "Amazon Product wasn't saved" }, status: :unprocessable_entity }
          end
        end
      end
    rescue ArgumentError => e
      respond_to do |format|
        format.html { redirect_to root_path, notice: e.message }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    rescue SocketError => e
      respond_to do |format|
        format.html { redirect_to root_path, notice: e.message , status: :unprocessable_entity}
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

  def validate_url(url)
    valid_prefixes = %w[https://www.amazon.com/ www.amazon.com/ amazon.com/]

    unless valid_prefixes.any? { |prefix| url.start_with?(prefix) }
      raise ArgumentError, 'Invalid Amazon URL. Must start with https://www.amazon.com/, www.amazon.com/, or amazon.com/'
    end
  end
end
