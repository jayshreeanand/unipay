class RenameTypeToKind < ActiveRecord::Migration[6.0]
  def change
    rename_column :contacts, :type, :kind
  end
end
