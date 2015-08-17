class AddScreenshotsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :screenshots, :json
  end
end
