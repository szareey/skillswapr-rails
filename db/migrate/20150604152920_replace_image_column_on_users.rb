class ReplaceImageColumnOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :user_img
    add_attachment :users, :user_img
  end
end
