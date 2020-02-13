class Favorite < ApplicationRecord
    belongs_to :book
    belongs_to :user 
    accepts_nested_attributes_for :book
    

 
end
