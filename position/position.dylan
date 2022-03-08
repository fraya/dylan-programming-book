Module: position

Synopsis: Express the position of an object as an absolute position
          with latitude and longitude or as a relative position with a
          distance and an angle.
	  
Author:   Fernando Raya
License:  See LICENSE

define class <position> (<object>)
end class <position>;

define class <absolute-position> (<position>)
  constant slot latitude;
  constant slot longitude;
end class <absolute-position>;

define class <relative-position> (<position>)
  constant slot distance;
  constant slot angle;
end class <relative-position>;

