require_dependency 'projects_controller'

module ProjectTree
    module Patches
        module ProjectsControllerPatch
        
            def self.included(base) # :nodoc:
                base.send(:include, InstanceMethods)
                base.class_eval do
                    unloadable
                    #the before_action is who gives the authorization to execute the function
                    before_action :authorize, :except => [ :index, :children, :autocomplete, :list, :new, :create, :copy, :archive, :unarchive, :destroy ]
                end
            end
            
            module InstanceMethods
                
                # REST resource '/projects/:id/children'
                def children
                    project = Project.find(params[:id])

                    result = {}
                    
                    # encapsulates all children of current project
                    children = []
                    
                    project.children.each do |child|

                        # return only active projects to the result
                        if child.status == 1
                            entry = {}
                            entry[:id] = child.id
                            entry[:name] = child.name
                            entry[:identifier] = child.identifier
                            entry[:has_children] = (child.children.length > 0) ? true : false
                            children << entry
                        end
                    end
                    # add children to the result
                    result[:children] = children
                    render json: result
                end
            end     
        end 
    end
end

ProjectsController.send(:include, ::ProjectTree::Patches::ProjectsControllerPatch)
