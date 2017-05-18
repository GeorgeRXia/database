class CreateCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |i|
      i.string :acomment
      i.integer :user_id
      i.integer :blog_id
    end
  end
end
