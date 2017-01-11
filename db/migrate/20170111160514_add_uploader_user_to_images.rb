class AddUploaderUserToImages < ActiveRecord::Migration
  def change
    add_column :images, :pictureuploader, :integer
  end
end
