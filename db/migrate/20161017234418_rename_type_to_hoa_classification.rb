class RenameTypeToHoaClassification < ActiveRecord::Migration[5.0]
  def change
  	rename_column :inserts, :type, :hoa_classification
  end
end
