#!/usr/bin/env bash
#
# Description of the script.


# Number of expected persistent workspaces (adjust if needed)
NUM_WORKSPACES=5

# Get active workspace ID
active_ws=$(hyprctl activeworkspace -j | jq -r '.id')

# Get list of current workspaces with their window counts
workspaces_json=$(hyprctl workspaces -j)
declare -A window_counts

# Populate window_counts[ID]=num_windows
while IFS="=" read -r id windows; do
    window_counts["$id"]="$windows"
done < <(echo "$workspaces_json" | jq -r '.[] | "\(.id)=\(.windows)"')

# Build the output text
output=""
for ((i=1; i<=NUM_WORKSPACES; i++)); do
    if [[ "$i" -eq "$active_ws" ]]; then
        output+="● "
    elif [[ "${window_counts[$i]}" -gt 0 ]]; then
        output+="◑ "
    else
        output+="○ "
    fi
done

# Output JSON for Waybar
echo "{\"text\": \"${output% }\", \"tooltip\": \"Workspaces\", \"class\": \"custom-workspaces\"}"
