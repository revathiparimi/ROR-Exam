class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :url
      t.string :Account_type

      t.timestamps
    end
  end
end
