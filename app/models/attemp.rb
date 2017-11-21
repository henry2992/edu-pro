class Attemp < ApplicationRecord
  has_many :answers
  belongs_to :list
end

