class User < ApplicationRecord
    has_secure_password
    has_many :specialities

    has_many :article_pops
    has_many :articles, through: :article_pops

    has_many :comment_pops
    has_many :comments

    validates_presence_of :email, on: :create, message: "You must provide an email addres"
    validates_uniqueness_of :email, on: :create, message: "That email is taken by another user"
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    validates_presence_of :password_digest, on: :create, message: "You must provide a password"

    # def comments
    #     @comments = Comment.select do |comment| 
    #         comment.pops.user_id === self.id
    #     end
    # end

end
