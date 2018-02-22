require_dependency 'projects_helper'

module ProjectTree
	module Patches
		module ProjectsHelperPatch
		
			def top_projects
				@top_projects ||= find_toplevel_projects
			end
		
		
			def self.included(base) # :nodoc:
				base.send(:include, InstanceMethods)

				#base.class_eval do
					# 'unloadable' -> This is required only in the development mode
					# unloadable
					
					# chain definition about new method which overrides to old method (see below: 'new_method_with_old_method')
					#alias_method_chain :new_method, :old_method

					# Anything you type in here is just like typing directly in the core
					# source files and will be run when the controller class is loaded.
			end

			module InstanceMethods
				
				# new method - fetches only the toplevel projects 
				def find_toplevel_projects
					queryResult = ActiveRecord::Base.connection.exec_query("
						select p.id  
						from 
							#{Project.table_name} p
						where
							p.parent_id is null")
					
					# load project as object and store it to the result
					result = []
					queryResult.each do |row|
						result << Project.find(row['id'])
					end	
					
					return result
				end
				
				
				#Insert overrides here
				#def new_method_with_old_method
					# your code
				#end
			end
		end
	end
end

ProjectsHelper.send(:include, ProjectTree::Patches::ProjectsHelperPatch)
