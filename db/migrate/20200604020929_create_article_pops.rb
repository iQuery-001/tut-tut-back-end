class CreateArticlePops < ActiveRecord::Migration[6.0]
  def change
    create_table :article_pops do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :value

      t.timestamps
    end
  end
end
