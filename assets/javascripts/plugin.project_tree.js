/** 
 * Contains custom functions which needed for customizing projects overview 
 * within the Redmine TreeView plugin.
 * 
 * @author Uwe Heber <uwe@heber.it>
 * @since 1.0
 */
$(document).ready(function () {

    console.log("document loaded");

    /**
     * add #click' event listener to the root projects which have child projects
     */
    $('span.toggle').click(function () {
        showHideChildren($(this));
    });
});


/**
 * show or hide the child projects for the given project
 * 
 * @param {type} project jQuery object for which the children should be displayed
 * @returns {undefined}
 */
function showHideChildren(project) {
    var projectName = project.text();
    if (project.hasClass("collapsed")) {
        project.addClass("expanded").removeClass("collapsed");
        project.attr("title", titleHideSubProjects);
        addChildren(project);
    } else {
        project.addClass("collapsed").removeClass("expanded");
        project.attr("title", titleShowSubProjects);
        removeChildren(project);
    }
}

/**
 * fetch the child projects for a given project from Redmine and adds them to 
 * the DOM tree.
 * 
 * @param {type} project jQuery object for which the children should be added
 * @returns {undefined}
 */
function addChildren(project) {
    var projectId = project.attr("id");
    var urlProjectChildren = "/projects/" + projectId + "/children";
    $.get(urlProjectChildren, function (data) {
        if (data.children.length > 0) {
            var projectList = buildProjectList(data.children, projectId);
            projectList.insertAfter(project.next());
        }
    });
}

/**
 * removes the child projects for a given project from the DOM tree
 * 
 * @param {type} project jQuery object for which the children should be removed
 * @returns {undefined}
 */
function removeChildren(project) {
    var projectId = project.attr("id");
    $('ul[data-project-parent-id="' + projectId + '"]').remove();
}

/**
 * builds a project list for the given child projects which belong to a parent 
 * project
 * 
 * @param {type} children XmlHttpResponse (JSON), containing all child projects 
 * for the given parent project
 * @param {type} projectId identifier of parent project, for which the children 
 * project list should be generated
 * @returns {$|buildProjectList.unorderedList} jQuery object, containing HTML 
 * structure as unstructured list
 */
function buildProjectList(children, projectId) {

    var unorderedList = $('<ul data-project-parent-id="' + projectId + '"/>');

    $.each(children, function (key, child) {

        var listItem = $('<li class="project child"/>');

        if (child.has_children) {
            var span = $('<span class="toggle collapsed" id="' + child.identifier + '" title="' + titleShowSubProjects + '"/>');
            listItem.append(span);
            // add event listener
            $(span).click(function () {
                showHideChildren($(this));
            });
        } else {
            var span = $('<span class="spacer"></span>');
            listItem.append(span);
        }

        var anchor = $('<a href="/projects/' + child.identifier + '"/>');
        anchor.text(child.name);
        listItem.append(anchor);

        unorderedList.append(listItem);
    });
    return unorderedList;
}

