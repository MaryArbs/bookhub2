class Book < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites
    belongs_to :author
    validates :title, presence: true
end
