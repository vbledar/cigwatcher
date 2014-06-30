<div class="info-panel notification">
    <div class="default-informational">
        <h2>
            <g:message code="next.cigar.on" default="Next Cigar On..."/>
        </h2>
    </div>

    <div class="full-line"></div>

    <div class="spacer20"></div>
    <div class="spacer20"></div>

    <g:hiddenField id="duration-in-seconds" name="duration-in-seconds" value="${durationInSeconds}"/>

    <div class="next-cigar-counter" style="margin-left: auto; margin-right: auto; text-align: center">
    </div>

    <div class="ui-grid-a">
        <div class="ui-block-a" style="padding: 5px;">
            <button id="skippedThisCigar" class="ui-btn ui-corner-all neon-shadow-light">
                Skip This Time
            </button>
        </div>
        <div class="ui-block-b" style="padding: 5px;">
            <button id="smokedThisCigar" class="ui-btn ui-corner-all neon-shadow-light">
                Smoked This One
            </button>
        </div>
    </div>
</div>