class List < ApplicationRecord
	has_many :list_items
	has_many :attemps
	accepts_nested_attributes_for :list_items
end

