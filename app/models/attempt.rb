class Attempt < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :list
end
