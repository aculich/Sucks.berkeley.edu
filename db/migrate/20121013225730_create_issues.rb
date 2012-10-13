class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.string :action
      t.string :goal
      t.text :identity_tags
      t.datetime :date_entered

      t.timestamps
    end
  end
end
