class AddDivisionToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :division, :boolean
  end
end
