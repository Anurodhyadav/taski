class ChangeDataTypeForStage < ActiveRecord::Migration[7.0]
  def change
    change_column :projects, :stage, :string
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
