class Comment < ApplicationRecord
    has_many :comment_pops
    belongs_to :user
    belongs_to :article

    # def pops
    #     @pops = CommentPop.where(Comment_id: self.id)
    # end
end
