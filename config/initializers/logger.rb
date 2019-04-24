require 'le'

# Now it would be global variable for whole application that's using this
# library.
LOGGER = Le.new('1', local: Settings.development?)
