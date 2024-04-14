class CreateAmazonProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :amazon_products do |t|
      t.string :url, null: false
      t.json :word_frequency

      t.timestamps
    end
  end
end
