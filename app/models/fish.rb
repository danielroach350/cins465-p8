class Fish < ActiveRecord::Base
	belongs_to :user
	has_many :weathers, dependent: :destroy
	has_many :notes, dependent: :destroy
end
