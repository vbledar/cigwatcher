
<div data-role="popup" id="createReportInfoPopup" class="ui-corner-all">
    <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
    <g:form name="createReportInfo" controller="settings" action="ajaxCreateReportInfo">
        <div style="padding:10px 20px;">
            <h3>Report Information</h3>
            <label for="ordering" class="ui-hidden-accessible">
                <g:message code="ordering.field.name" default="Ordering:" />
            </label>
            <input type="number" name="ordering" id="ordering" min="1" max="20" step="1" value="1" placeholder="Report Order">

            <g:select id="reportTemplateSelectElement"
                      name="reportTemplate"
                      from="${reportTemplates}"
                      value="name"
                      keys="${reportTemplates*.id}"
                      optionKey="${id}"
                      optionValue="name"/>

            <div class="full-line"></div>

            <div id="errorMessageReportInfo" class="hidden">
                <label></label>
            </div>

            <button id="createReportInfoButton" form-id="createReportInfo" type="submit" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check">
                <g:message code="create.button.label" default="Create" />
            </button>
        </div>
    </g:form>
</div>

<script type="application/javascript">

    $(document).on('pageinit', function() {
        $('#createReportInfoButton').off('click').on('click', function(event) {
            execARFromElementWithSuccessAndErrorCallbacks(event, this, reportInfoCreateSuccess, reportInfoCreateFailure);
        })
    });

    function reportInfoCreateSuccess(event, element, data, textStatus, jqXHR) {
        if (data.success === false) {
            $('#errorMessageReportInfo > label').html(data.message);
            $('#errorMessageReportInfo').removeClass('hidden');
        } else {

            var counter = parseInt($('#report-info-size-counter').html());
            if (counter === 0) {
                $('#report-info-list-empty').slideToggle('slow', function(event) {
                    $('#report-info-list-empty').remove();

                    $('#reportInfoList').append(data, {
                        'data-transition': 'slide'
                    })

                    $('#reportInfoList').listview('refresh');

                    var formId = $(element).attr('form-id');
                    $('#'+formId).trigger('reset');

                    counter++;
                    $('#report-info-size-counter').html(counter)
                });
            }
        }
    }

    function reportInfoCreateFailure(event, element, data) {
        $('#errorMessageReportInfo > label').html(data.message);
        $('#errorMessageReportInfo').removeClass('hidden');
    }
</script>