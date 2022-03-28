Module: chapter8
Synopsis: 
Author: 
Copyright: 

define function main
    (name :: <string>, arguments :: <vector>)
  
  format-out("Creating and instance of <absolute-position>:\n");
  let my-absolute-position 
    = make(<absolute-position>,
	   latitude: make(<latitude>,
			  total-seconds: encode-total-seconds(42,19,34),
			  direction: "North"),
	   longitude: make(<longitude>,
			   total-seconds: encode-total-seconds(70,56,26),
			   direction: "West"));
  format-out("%s\n\n", as(<string>, my-absolute-position));
  
  format-out("Creating an instance of <relative-position>:\n");
  let her-relative-position
    = make(<relative-position>,
	   distance: 30.0,
	   angle: make(<relative-angle>,
		       total-seconds: encode-total-seconds(90,5,0)));
  format-out("%s\n\n", as(<string>, her-relative-position));
  
  format-out("Creating an instance of <time-offset> in minus-2-hours.\n");
  let minus-2-hours
    = make(<time-offset>,
	   total-seconds: - encode-total-seconds(2,0,0));
  format-out("%s\n", as(<string>, minus-2-hours));
  
  format-out("Creating an instance of <time-offset> in plus-15-20-45.\n");
  let plus-15-20-45
    = make(<time-offset>,
	   total-seconds: encode-total-seconds(15,20,45));
  format-out("%s\n", as(<string>, plus-15-20-45));
  
  format-out("Creating an instance of <time-of-day> in 8-30-59.\n");
  let t-8-30-59
    = make(<time-of-day>,
	   total-seconds: encode-total-seconds(8,30,59));
  format-out("%s\n", as(<string>, t-8-30-59));
  
  format-out("Adding <time-offset> + <time-offset>: minus-2-hours + plus-15-20-45:\n");
  format-out("%s\n", as(<string>, minus-2-hours + plus-15-20-45));
  
  format-out("Adding <time-offset> + <time-of-day>: minus-2-hours + 8-30-59:\n");
  format-out("%s\n", as(<string>, minus-2-hours + t-8-30-59));
  format-out("Adding <time-of-day> + <time-offset>: 8-30-59 + minus-2-hours:\n");
  format-out("%s\n", as(<string>, t-8-30-59 + minus-2-hours));
  
  exit-application(0);
end function main;

main(application-name(), application-arguments());
