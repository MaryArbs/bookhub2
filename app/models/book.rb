class Book < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites
    belongs_to :author
    validates :title, presence: true
    # validates :title, uniqueness: true
    accepts_nested_attributes_for :author, reject_if: proc {|attr| attr['name'].blank? }  #allows you to create author with drop down menu in new view

    def self.order_alphabetically
      self.order(title: :asc)   
    end

end
