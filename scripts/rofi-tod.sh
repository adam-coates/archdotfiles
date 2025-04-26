#!/usr/bin/env bash

set -e

TODO=$(rofi -dmenu \
    -l 0 \
    -yoffset -300 \
    -width 40 \
    -no-config \
    -theme-str 'entry { placeholder: "Enter your task..."; text-color: #D4BE98; }' \
    -theme-str 'window { transparency: "real"; background-color: #32302F; border: 1; border-color: #D4BE98; }' \
    -theme-str 'textbox-prompt-colon { str: " "; text-color: #D4BE98; }' \
    -theme-str 'listview { background-color: #32302F; }' \
    -theme-str 'element-text { text-color: #D4BE98; }' \
    -p "Todo:")

if [[ -n $TODO ]]; then
    tod t q -c "$TODO"
    notify-send -a Todoist "Saved Todo: $TODO"
fi
#
#
#
#
#
#
#
#
#
#
# set -e
#
# # Create temporary files for projects and labels
# TEMP_DIR="/tmp/todoist-rofi"
# PROJECTS_FILE="$TEMP_DIR/projects.txt"
# LABELS_FILE="$TEMP_DIR/labels.txt"
#
# mkdir -p "$TEMP_DIR"
#
# # Create projects and labels files with manual entries
# create_data_files() {
#     # Create projects file with your common projects
#     cat > "$PROJECTS_FILE" << EOF
# #personal
# #Routine 🔄
# #shopping list
# #moving house
# #coding
# #work
# #7T auditory claustrum
# #Dissertation
# #3rd paper
# #Weekly Review
# EOF
#
#     # Create labels file with your common labels
#     cat > "$LABELS_FILE" << EOF
# @home
# @work
# @urgent
# @today
# @weekend
# @errands
# @waiting
# @important
# EOF
# }
#
# # Create data files
# create_data_files
#
# # Function to handle dynamic suggestions
# process_input() {
#     local input="$1"
#     local last_word=$(echo "$input" | awk '{print $NF}')
#
#     # If last word starts with # and projects file exists, show project suggestions
#     if [[ "$last_word" == "#"* && -f "$PROJECTS_FILE" ]]; then
#         grep -i "^$last_word" "$PROJECTS_FILE" || echo "$last_word"
#     # If last word starts with @ and labels file exists, show label suggestions
#     elif [[ "$last_word" == "@"* && -f "$LABELS_FILE" ]]; then
#         grep -i "^$last_word" "$LABELS_FILE" || echo "$last_word"
#     else
#         echo "$input"
#     fi
# }
#
#
# # Main Rofi script with dynamic suggestions
# todo_input() {
#     local input=""
#     local output=""
#     local key=""
#
#     while true; do
#         suggestions=$(process_input "$input")
#
#         output=$(echo -e "$suggestions" 
#  rofi -dmenu \
#             -l 10 \
#             -yoffset -300 \
#             -width 40 \
#             -no-config \
#             -theme-str 'entry { placeholder: "Enter your task..."; text-color: #D4BE98; }' \
#             -theme-str 'window { transparency: "real"; background-color: #32302F; border: 1; border-color: #D4BE98; }' \
#             -theme-str 'textbox-prompt-colon { str: " "; text-color: #D4BE98; }' \
#             -theme-str 'listview { background-color: #32302F; }' \
#             -theme-str 'element-text { text-color: #D4BE98; }' \
#             -p "Todo:" \
#             -mesg "Type # for projects, @ for labels" \
#             -kb-custom-1 "Alt+t" \
#             -kb-custom-2 "Return" \
#             -format "f;s;i" \
#             -filter "$input")
#
#         # Extract key press and selection
#         key=$(echo "$output" 
#  cut -d ';' -f 2)
#         selection=$(echo "$output" 
#  cut -d ';' -f 1)
#
#         # Exit if Escape or Return was pressed with valid input
#        if [[ -z "$output" || "$key" == "1" ]]; then 
#             return 1
#         elif [[ "$key" == "2" && -n "$selection" ]]; then
#             echo "$selection"
#             return 0
#         fi
#
#         # If the selection is a project or label, replace the last word with it
#        if [[ "$selection" == "#"* || "$selection" == "@"* ]]; then 
#             input=$(echo "$input" 
#  sed 's/ [^ ]*$/ /') # Remove last word
#             input="${input}${selection} " # Add selection with space
#         else
#             input="$selection"
#         fi
#     done
# }
#
# # Run the input function
# TODO=$(todo_input)
# if [[ $? -eq 0 && -n "$TODO" ]]; then
#     tod t q -c "$TODO"
#     notify-send -a Todoist "Saved Todo: $TODO"
# fi
#
# # Clean up temp files
# rm -f "$PROJECTS_FILE" "$LABELS_FILE"


# set -e
#
# # Create temporary files for projects and labels
# TEMP_DIR="/tmp/todoist-rofi"
# PROJECTS_FILE="$TEMP_DIR/projects.txt"
# LABELS_FILE="$TEMP_DIR/labels.txt"
#
# mkdir -p "$TEMP_DIR"
#
# # Create projects and labels files with manual entries
# create_data_files() {
#     # Create projects file with your common projects
#     cat > "$PROJECTS_FILE" << EOF
# #personal
# #Routine 🔄
# #shopping list
# #moving house
# #coding
# #work
# #7T auditory claustrum
# #Dissertation
# #3rd paper
# #Weekly Review
# EOF
#
#     # Create labels file with your common labels
#     cat > "$LABELS_FILE" << EOF
# @home
# @work
# @urgent
# @today
# @weekend
# @errands
# @waiting
# @important
# EOF
# }
#
# # Create data files
# create_data_files
#
# # Function to handle project and label suggestions
# get_suggestions() {
#     local input="$1"
#     local last_word=$(echo "$input" | awk '{print $NF}')
#
#     if [[ "$last_word" == "#"* && -f "$PROJECTS_FILE" ]]; then
#         # Show project suggestions
#         grep -i "^$last_word" "$PROJECTS_FILE" || echo "$input"
#     elif [[ "$last_word" == "@"* && -f "$LABELS_FILE" ]]; then
#         # Show label suggestions
#         grep -i "^$last_word" "$LABELS_FILE" || echo "$input"
#     else
#         # Just return the input if no suggestions
#         echo "$input"
#     fi
# }
#
# # Main function to handle the Rofi interaction
# add_todo() {
#     local current_input=""
#
#     while true; do
#         # Get suggestions based on current input
#         suggestions=$(get_suggestions "$current_input")
#
#         # Show Rofi with current input and suggestions
#         result=$(echo -e "$suggestions" | rofi -dmenu \
#             -l 10 \
#             -yoffset -300 \
#             -width 40 \
#             -no-config \
#             -theme-str 'entry { placeholder: "Enter your task..."; text-color: #D4BE98; }' \
#             -theme-str 'window { transparency: "real"; background-color: #32302F; border: 1; border-color: #D4BE98; }' \
#             -theme-str 'textbox-prompt-colon { str: " "; text-color: #D4BE98; }' \
#             -theme-str 'listview { background-color: #32302F; }' \
#             -theme-str 'element-text { text-color: #D4BE98; }' \
#             -p "Todo:" \
#             -mesg "Type # for projects, @ for labels" \
#             -filter "$current_input")
#
#         # Exit if user pressed Escape or closed Rofi
#         if [[ -z "$result" ]]; then
#             return 1
#         fi
#
#         # If user selected a suggestion that starts with # or @
#         if [[ "$result" != "$current_input" && ("$result" == "#"* || "$result" == "@"*) ]]; then
#             # Replace the last word with the selected project/label
#             current_input=$(echo "$current_input" | sed 's/ [^ ]*$/ /')
#             current_input="${current_input}${result} "
#         else
#             # User has completed input, return the result
#             echo "$result"
#             return 0
#         fi
#     done
# }
#
# # Run the function to get the todo
# TODO=$(add_todo)
#
# # Process the result
# if [[ $? -eq 0 && -n "$TODO" ]]; then
#     tod t q -c "$TODO"
#     notify-send -a Todoist "Saved Todo: $TODO"
# fi
#
# # Clean up temp files
# rm -rf "$TEMP_DIR"
