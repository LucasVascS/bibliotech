class Category < ApplicationRecord
  
  has_many :books
  validates :categoriename, presence: true
end
