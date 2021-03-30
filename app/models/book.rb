class Book < ApplicationRecord

    belongs_to :category
    belongs_to :created_by, class_name: 'User' 

    validates :name, :author, :synopsis, presence: true
    validates_length_of :synopsis, maximum: 100    
end

