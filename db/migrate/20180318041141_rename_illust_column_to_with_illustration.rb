class RenameIllustColumnToWithIllustration < ActiveRecord::Migration[5.1]
  def change
    rename_column :addtional_plans, :illust, :with_illustration
  end
end
