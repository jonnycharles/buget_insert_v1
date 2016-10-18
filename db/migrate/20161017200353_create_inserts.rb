class CreateInserts < ActiveRecord::Migration[5.0]
  def change
    create_table :inserts do |t|
      t.string :name
      t.string :type
      t.string :hud_id
      t.string :month_hud_expiration
      t.string :day_hud_expiration
      t.string :year_hud_expiration
      t.string :va_id
      t.string :month_va_approval
      t.string :day_va_approval
      t.string :year_va_approval
      t.boolean :hud_approval

      t.timestamps
    end
  end
end
