#!/usr/bin/awk -f

BEGIN {
  if( ARGV[1] == "--column" )
  {
    cmd = "strftime(\"%c\", ARGV[2])"
    delete ARGV[1]
    delete ARGV[2]
  }
  else if( ARGV[1] == "-c" )
  {
    cmd = "strftime(\"%c\", ARGV[2])"
    delete ARGV[1]
    delete ARGV[2]
  }
  else
    cmd = "cat"
}
{
  print | cmd
}
