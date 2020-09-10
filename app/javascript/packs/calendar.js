import { enableRipple } from '@syncfusion/ej2-base';
enableRipple(true);

import { Calendar, ChangedEventArgs } from '@syncfusion/ej2-calendars';
/**
 * Default Calendar sample
 */


    
    let calendar = new Calendar({
        change: valueChange
    });
    calendar.appendTo('#calendar');
    function valueChange(args) {
        /*Displays selected date in the label*/
        document.getElementById('date_label').textContent = 'Selected Value: ' + args.value.toLocaleDateString();
    }