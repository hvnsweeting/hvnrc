#/usr/bin/tclsh
#Today(dmY): 27-12-2012
# Linux user listing
# by hvn@familug.org

set infile [open "/etc/passwd" r]
set texts [read -nonewline $infile]
set lines [split $texts "\n"]
foreach line $lines {
    set fields [split $line ":"]
    puts [lindex $fields 0]
}
