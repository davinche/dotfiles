#!/bin/bash

the_time=$(date +'%I:%M')
the_date=$(date +'%A, %b %d')
output='<span fgcolor="#FFFFFF" bgcolor="#000000">'
output+='<span font_size="x-large" rise="-2000"> </span>'
output+="  $the_date  "
output+='<span font_size="x-large" rise="-2000"></span>'
output+="  $the_time   "
output+='</span>'
echo "$output"
