# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
	validates :name, presence: true
	
	has_many :has_categories
	has_many :products, through: :has_categories
end
