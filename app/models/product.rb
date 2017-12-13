# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :decimal(12, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
	has_many :has_categories, dependent: :destroy
	has_many :categories, through: :has_categories

	validates :name, presence: true
	validates :price, presence: true

	after_create :save_categories

  #Custom setter
	def categories=(value)
		@categories = value
	end

	private

	def save_categories
  	@categories.each do |category_id|
			HasCategory.create(category_id: category_id, product_id: self.id) #self es la instancia actual de product
		end
	end

end
