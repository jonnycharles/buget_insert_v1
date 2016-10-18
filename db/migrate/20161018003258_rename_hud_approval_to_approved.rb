class RenameHudApprovalToApproved < ActiveRecord::Migration[5.0]
  def change
  	rename_column :inserts, :hud_approval, :approved
  end
end
