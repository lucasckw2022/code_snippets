class UpdateCode < ActiveRecord::Migration
  def change
    add_column :codes, :title, :string
  end
end
