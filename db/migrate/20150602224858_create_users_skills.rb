class CreateUsersSkills < ActiveRecord::Migration
  def change
    create_table :users_skills do |t|
      t.belongs_to :user, :skill
      t.string :type
      t.timestamps
    end
  end
end
