#!/bin/bash

urgent_tasks=$(task rc.verbose: rc.report.next.columns:description.count,due rc.report.next.labels:1,2 +PENDING +OVERDUE or +DUETODAY 2> /dev/null | wc -l)

if [ "$urgent_tasks" -gt 0 ]; then
    echo " $urgent_tasks"
else
    echo "0"
fi
