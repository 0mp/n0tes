# References:
# https://en.wikibooks.org/wiki/Regular_Expressions/POSIX-Extended_Regular_Expressions
# http://www.tldp.org/LDP/GNU-Linux-Tools-Summary/html/x11655.htm
# Chapter 7.5.2 Wildcarding in Classic Shell Scripting by Robbins and Beebe, 

text='  	 some text
  	 '
# Trim leading whitespace.
text="${text#"${text%%[![:space:]]*}"}"
# Trim trailing whitespace.
text="${text%"${text##*[![:space:]]}"}"

printf ">%s<\n" "$text"
# Should output '>some text<'.
