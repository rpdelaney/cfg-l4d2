#
# These patterns clean up common formatting and typographical errors to assure the keybindings are accurately converted.
#

#Add double quotes around the first argument of keybindings
s@^bind (\w*?)\s(.*)@bind "\1" \2@

#Add double quotes around the second argument of the keybindings
#s@(^bind "(\w+?)")\s("?)(([A-Za-z0-9+-]|\;)+?)("?)@\1 "\4"@

#trim trailing whitespace from all lines
s@[ \t]*$@@

#replace tabs with spaces
s@\t@ @g
