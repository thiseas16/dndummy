class AddFieldsToFeats < ActiveRecord::Migration[7.0]
  def change
    add_column :feats, :parent_feat_id, :integer
    add_foreign_key :feats, :feats, column: :parent_feat_id, optional: true
  end
end
