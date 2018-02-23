# Redmine Projects Treeview plugin
This [Redmine](http://redmine.org/) plugin allows you to show up your projects as a tree. 

Initially, only the root projects are determined and displayed in projects overview. This can be helpful when Redmine hosts many projects including sub projects where the fetching and rendering takes a considerable amount of time.

If a root project has sub projects, then they can be lazy loaded via mouse click. 

For this plugin a new REST resource `/projects/:id/children` was introduced, which determines and delivers the available children of given project in JSON format:  

```json
{
  "children": [
    {
      "id": 7,
      "name": "MySubProject_01",
      "identifier": "mysubproject_01",
      "has_children": true
    },
    {
      "id": 8,
      "name": "MySubProject_02",
      "identifier": "mysubproject_02",
      "has_children": false
    },
    {
      "id": 9,
      "name": "MySubProject_03",
      "identifier": "mysubproject_03",
      "has_children": false
    },
    {
      "id": 10,
      "name": "MySubProject_04",
      "identifier": "mysubproject_04",
      "has_children": false
    }
  ]
}
```
 
The response of this REST resource is used within AJAX call, to manipulate the DOM tree via jQuery.

## Screenshots
![alt text][screenshot]

## Redmine Compatible
The plugin is compatible with Redmine 3.2.X 


## Installation and Setup
Please apply general instructions for Redmine plugins [here](http://www.redmine.org/wiki/redmine/Plugins).

Following steps are required to install the plugin:
1.  Clone this repository to your Redmine instance as `plugins/project_tree`:

    `$ git clone https://github.com/UweHeber/redmine-project-tree-plugin plugins/project_tree`
    
    The name is important, because of the way the Redmine plugin system works.
 2. Finally restart your Redmine instance.
 
## License 
 This plugin is licensed under the MIT license. See LICENSE for details.

## Special Thanks
Special thanks go to [Matthias](http://petermann-it.de) for his feedback and support in finding an optimal approach to load sub-projects lazy and testing support.

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[screenshot]: http://heber.it/images/github/redmine-projects-tree.png "Screen shot - Redmine Projects Treeview plugin"