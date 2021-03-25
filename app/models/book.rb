class Book < ApplicationRecord

    belongs_to :category

    validates :name, :author, :synopsis, presence: true
    validates_length_of :synopsis, maximum: 100

    
end
