# Redmine Projects Treeview plugin
This Redmine plugin allows you to show up your projects as a tree. Initially, only the root projects are displayed. If a
root project has sub projects, then they can be lazy loaded via mouse click. This is helpful when Redmine hosts many projects including sub projects where the fetching and rendering takes a considerable amount of time.


## Screenshots
![alt text][screenshot]

## Redmine Compatible
The plugin is compatible with Redmine 3.2.X 


## Installation and Setup
Please apply general instructions for Redmine plugins [here](http://www.redmine.org/wiki/redmine/Plugins).

These plugins must be installed first.

Following steps are required to install the plugin:
1.  Clone this repository to your Redmine instance as `plugins/project_tree`:

    `$ git clone https://github.com/UweHeber/redmine-project-tree-plugin plugins/project_tree`
    
    The name is important, because of the way the Redmine plugin system works.
 2. Finally restart your Redmine instance.
 
## License 
 This plugin is licensed under the MIT license. See LICENSE for details.


## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[screenshot]: http://heber.it/images/github/redmine-projects-tree.png "Screen shot - Redmine Projects Treeview plugin"