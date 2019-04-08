require 'redmine'

require 'project_tree/patches/projects_helper_patch'
require 'project_tree/patches/projects_controller_patch'

Redmine::Plugin.register :project_tree do

	name 'Project Tree plugin'
	author 'Uwe Heber, Matthias Petermann'
	description 'This is a Redmine plugin which will turn the projects page into a tree view'
	version '1.0.2'
	url 'https://github.com/UweHeber/redmine-project-tree-plugin'
	author_url 'http://heber.it/about, http://petermann-it.de'
end
