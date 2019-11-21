#!/bin/sh

#sensors | grep Core | awk '{print substr($3, 2, length($3)-5)}' | tr "\\n" " " | sed 's/ /°C  /g' | sed 's/  $//'

# This is a more accurate way attending to my `sensors` output,
# though I don't think these the core temperatures, I would say
# these are another chipsets temps; but at least is something.
sensors | grep "temp[0-9]" | awk '{print substr($2, 2, length($2)-3)}' | tr "\\n" " " | sed 's/ /°C /g' | sed 's/  $//'
