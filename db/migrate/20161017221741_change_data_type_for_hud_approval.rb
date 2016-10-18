class ChangeDataTypeForHudApproval < ActiveRecord::Migration[5.0]
  def change
  	change_column :inserts, :hud_approval, :string
  end
end
