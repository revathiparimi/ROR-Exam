class RemoveVideoColumn < ActiveRecord::Migration
  def change
  	remove_column :videos, :video, :LONGBLOB
  end
end
