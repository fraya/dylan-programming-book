Module: time
Synopsis: <sixty-unit> is a class that can be converted either hours,
          minutes and seconds, or to degrees, minutes and seconds. In the
          methods for encoding and decoding total seconds, we use the name
          `max-unit` to refer to the unit that is hours for time, and degrees
          for positions.
Author:   Fernando Raya
License:  See LICENSE

define abstract class <sixty-unit> (<object>)
  constant slot total-seconds :: <integer>,
    init-keyword: total-seconds:;
end class <sixty-unit>;

define method decode-total-seconds
    (total-seconds :: <integer>)
 => (hours :: <integer>, minutes :: <integer>, seconds :: <integer>)
  let(total-minutes, seconds) = truncate/(total-seconds, 60);
  let(hours, minutes) = truncate/(total-minutes, 60);
  values(hours, minutes, seconds);
end method decode-total-seconds;

define method encode-total-seconds
    (max-unit :: <integer>, minutes :: <integer>, seconds :: <integer>)
 => (total-seconds :: <integer>)
  ((max-unit * 60) + minutes) * 60 + seconds;
end method encode-total-seconds;

define method decode-total-seconds
    (sixty-unit :: <sixty-unit>)
 => (hours :: <integer>, minutes :: <integer>, seconds :: <integer>)
  decode-total-seconds(sixty-unit.total-seconds)
end;

