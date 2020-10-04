class Area < ApplicationRecord
	has_many :items, dependent: :destroy
	has_many :members

	validates :name, presence: true
	validates :name, uniqueness: true
end
