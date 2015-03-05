class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.attachment :hero_image

      t.timestamps
    end
  end
end
