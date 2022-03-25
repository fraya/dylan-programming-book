Module: time
Synopsis: Express the position of an object as an absolute position
          with latitude and longitude or as a relative position with a
          distance and an angle. 
Author:   Fernando Raya
License:  See LICENSE

define abstract class <angle> (<object>)
  constant slot total-seconds :: <integer>,
    init-keyword: total-seconds:;
end class <angle>;

define abstract class <directed-angle> (<angle>)
  constant slot direction :: <string>,
    init-keyword: direction:;
end class <directed-angle>;

define class <relative-angle> (<angle>)
end class <relative-angle>;

define class <latitude> (<directed-angle>)
end class <latitude>;

define class <longitude> (<directed-angle>)
end class <longitude>;

define abstract class <position> (<object>)
end class <position>;

define class <absolute-position> (<position>)
  constant slot latitude :: <latitude>,
    init-keyword: latitude:;
  constant slot longitude :: <longitude>,
    init-keyword: longitude:;
end class <absolute-position>;

define class <relative-position> (<position>)
  constant slot distance :: <single-float>,
    init-keyword: distance:;
  constant slot angle :: <relative-angle>,
    init-keyword: angle:;
end class <relative-position>;

define method decode-total-seconds
    (angle :: <directed-angle>)
 => (degrees :: <integer>, minutes :: <integer>, seconds :: <integer>)
  decode-total-seconds(angle.total-seconds)
end;

define method as
    (class == <string>, angle :: <directed-angle>)
 => (str :: <string>)
  let(degrees, minutes, seconds) = decode-total-seconds(angle);
  concatenate(integer-to-string(degrees), " degrees ",
	      integer-to-string(minutes), " minutes ",
	      integer-to-string(seconds), " seconds ",
	      angle.direction)
end method as;

define method as
    (class == <string>, position :: <latitude>)
 => (str :: <string>)
  concatenate(next-method(), " latitude")
end;

define method as
    (class == <string>, position :: <longitude>)
 => (str :: <string>)
  concatenate(next-method(), " longitude")
end;

define method as
    (class == <string>, position :: <absolute-position>)
 => (str :: <string>)
  concatenate(as(<string>, position.latitude), "\n", as(<string>, position.longitude))
end method as;

