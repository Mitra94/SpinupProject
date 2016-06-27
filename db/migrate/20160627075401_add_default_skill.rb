class AddDefaultSkill < ActiveRecord::Migration
  def change
	change_column :skills, :html_css, :integer, default: 0
	change_column :skills, :java, :integer, default: 0
	change_column :skills, :javascript, :integer, default: 0
	change_column :skills, :c, :integer, default: 0
	change_column :skills, :c_plus_plus, :integer, default: 0
	change_column :skills, :nodejs, :integer, default: 0
	change_column :skills, :database, :integer, default: 0
	change_column :skills, :algorithms, :integer, default: 0
	change_column :skills, :android, :integer, default: 0
	change_column :skills, :ios, :integer, default: 0
	
  end
end
