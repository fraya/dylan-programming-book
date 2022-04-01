Module:   time
Author:   Fernando Raya
License:  See LICENSE
Synopsis: Module class hierarchy.
Keywords: sixty unit, time, angle
Comment:  See github#/fraya/dylan-programming-book.
          Best viewed with https://www.gnu.org/software/hyperbole

// Acording to ISO-80000-2
// http://www.iso.org/iso/catalogue_detail?csnumber=31887

define constant <natural-number>
  = limited(<integer>, min: 0);

  // doc:"../doc/architecture.md#Sixty unit"

define abstract class <sixty-unit> (<object>)
  constant slot total-seconds :: <integer>,
    required-init-keyword: total-seconds:
end class <sixty-unit>;

// doc:"../doc/architecture.md#Time"

define abstract class <time> (<sixty-unit>)
end class <time>;

define class <time-of-day> (<time>)
end class <time-of-day>;

define class <time-offset> (<time>)
end class <time-offset>;

/** <angle> */

define abstract class <angle> (<sixty-unit>)
end class <angle>;

define abstract class <directed-angle> (<angle>)
  constant slot direction :: <symbol>,
    init-keyword: direction:
end class <directed-angle>;

define class <relative-angle> (<angle>)
end class <relative-angle>;

// doc:"../doc/architecture.md#Latitude"

define class <latitude> (<directed-angle>)
end class <latitude>;

define method initialize (latitude :: <latitude>, #key)
  next-method();
  if (latitude.direction ~= #"north" & latitude.direction ~= #"south")
    error("%= is not north or south", latitude.direction)
  end if
end;

// doc:"../doc/architecture.md#Longitude"

define class <longitude> (<directed-angle>)
end class <longitude>;

define method initialize (longitude :: <longitude>, #key)
  next-method();
  if (longitude.direction ~= #"east" & longitude.direction ~= #"west")
    error("%= is not east or west", latitude.direction)
  end if
end;

/** <position> */

define abstract class <position> (<object>)
end class <position>;

define class <absolute-position> (<position>)
  constant slot latitude :: <latitude>,
    init-keyword: latitude:;
  constant slot longitude :: <longitude>,
    init-keyword: longitude:
end class <absolute-position>;

define class <relative-position> (<position>)
  constant slot distance :: <single-float>,
    init-keyword: distance:;
  constant slot angle :: <relative-angle>,
    init-keyword: angle:
end class <relative-position>;
