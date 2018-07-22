
:- module(space, [
	      spaces//0
	  ]).

spaces -->
	space,
	space_tail.


space_tail -->
	space,
	!,
	space_tail.

space_tail -->
	[].

space -->
	" ".
