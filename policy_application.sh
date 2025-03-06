#!/bin/bash

# Save the original IFS value
OLDIFS=$IFS
IFS=$'\n'

# Run Azure Resource Graph query to fetch policy assignments containing 'NZLeader'
for x in $(az graph query -q "
    policyresources
    | where type == 'microsoft.authorization/policyassignments'
    | where tostring(properties.displayName) contains 'Application'
    | project strcat('az policy assignment delete --name ', name, ' --subscription ', subscriptionId)
" | jq -r ".data[].Column1"); do
    # Restore original IFS
    IFS=$OLDIFS
    echo "$x"  # Print the delete command
    # Uncomment the next line to actually execute the delete command
    # eval "$x"
    IFS=$'\n'
done

# Restore IFS
IFS=$OLDIFS
