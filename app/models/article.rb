class Article < ApplicationRecord
    has_many :article_pops
    has_many :users, through: :comment_pops
    has_many :comments
end
