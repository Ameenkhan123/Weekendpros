class AddLatitudeAndLongitudeToUserSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :user_skills, :address, :string
    add_column :user_skills, :latitude, :float
    add_column :user_skills, :longitude, :float
  end
end
