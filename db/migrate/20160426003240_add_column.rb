class AddColumn < ActiveRecord::Migration
  def change
    add_column :codes, :is_private, :boolean
  end
end
