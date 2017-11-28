class List < ApplicationRecord
	has_many :list_items
	has_many :attempts
	accepts_nested_attributes_for :list_items

	def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end
end

