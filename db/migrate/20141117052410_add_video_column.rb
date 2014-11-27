class AddVideoColumn < ActiveRecord::Migration
  def change
  	add_column :videos, :video, :LONGBLOB
  end
end
