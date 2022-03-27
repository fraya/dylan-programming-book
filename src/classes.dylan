Module:   time
Author:   Fernando Raya
License:  See LICENSE
Synopsis: Module class hierarchy.
          See graphic in "../doc/class-diagram.svg" and
          edit it in "../doc/class-diagram.plantuml"

/** <sixty-unit>

    <sixty-unit> is a class that can be converted either hours,
    minutes and seconds, or to degrees, minutes and seconds. In the
    methods for encoding and decoding total seconds, we use the name
    `max-unit` to refer to the unit that is hours for time, and
    degrees for positions.

*/

define abstract class <sixty-unit> (<object>)
  constant slot total-seconds :: <integer>,
    init-keyword: total-seconds:
end class <sixty-unit>;

/** <time>

    A specific time of day from 00:00 (midnight) to below 24:00
    (tomorrow).

*/

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
  constant slot direction :: <string>,
    init-keyword: direction:
end class <directed-angle>;

define class <relative-angle> (<angle>)
end class <relative-angle>;

define class <latitude> (<directed-angle>)
end class <latitude>;

define class <longitude> (<directed-angle>)
end class <longitude>;

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
