class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.datetime :date_entered
      t.integer :votes
      t.string :link_to_uservoice
      t.string :action
	  t.string :as_a
	  t.string :so_that
	  t.string :i_want
#      t.string :goal
#      t.text :identity_tags
#      t.datetime :date_entered

      t.timestamps
    end
  end
end
