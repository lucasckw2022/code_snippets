class AddKindReferencesToCode < ActiveRecord::Migration
  def change
    add_reference :codes, :kind, index: true, foreign_key: true
    remove_column :codes, :kind
  end
end
