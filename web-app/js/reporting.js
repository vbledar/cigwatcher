/**
 * Created by vbledar on 7/2/14.
 */

function buildReports() {
    console.log('Building reports page...');

    $.each($('.report-container'), function(index, element) {
        console.log('Running through all report elements...');

        var reportType = $(element).attr('report-type');
        if (reportType === 'line') {
            var url = $(element).attr('ajax-action-url');
            $.post(url, function(data, textStatus, jqXHR) {
                console.log('Post succeeded...');
                if (data.success === true) {
                    console.log('Action was executed successfully...');

                    var width = $(element).width;
                    var height = $(element).height;


                    createLineReport(data.reportData, element);
                }
            }).fail(function(message) {
                console.log('Post failed...');
                console.log(message);
            });
        }
    });
}


/**
 * This function will create a line report in the given container
 * with the given data. This function expects a canvas element as
 * a direct child of the container.
 *
 * @param data, the data on which the report will be built.
 * @param container, the container which holds the canvas on which
 * the report is built.
 */
function createLineReport(data, container) {
    var width = $(container).width();
    var height = $(container).height();

    var canvas = $(container).find('canvas')[0];
    canvas.width = width * 0.95;
    canvas.height = height * 0.80;

    console.log('Width: ' + width);
    console.log('Height: ' + height);

    var ctx = $(container).find('canvas')[0].getContext('2d');
    var myNewChart = new Chart(ctx);
    new Chart(ctx).Line(JSON.parse(data));

}