class Book < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites
    belongs_to :author
    validates :title, presence: true
    accepts_nested_attributes_for :author, reject_if: proc {|attr| attr['name'].blank? } #allows you to create author with drop down menu in new view
    accepts_nested_attributes_for :favorites
end
