class Article < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true, length: {minimum: 20}
	validates :categories, presence: true
end
