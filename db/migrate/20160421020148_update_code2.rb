class UpdateCode2 < ActiveRecord::Migration
  def change
    rename_column :codes, :content, :work
    rename_column :codes, :type, :kind
  end
end
