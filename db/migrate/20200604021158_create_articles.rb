class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :user_id
      # t.integer :article_pop_id
      t.string :title
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
