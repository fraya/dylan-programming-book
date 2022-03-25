Module: time
Synopsis: A specific time of day from 00:00 (midnight) to below 24:00
          (tomorrow)
Author:   Fernando Raya
License:  See LICENSE

define abstract class <time> (<sixty-unit>)
end class <time>;

define class <time-of-day> (<time>)
end class <time-of-day>;

define class <time-offset> (<time>)
end class <time-offset>;

define method decode-total-seconds
    (time :: <time>)
 => (hours :: <integer>, minutes :: <integer>, seconds :: <integer>)
  decode-total-seconds(abs(time.total-seconds));
end method decode-total-seconds;

define method as
    (class == <string>, t :: <time>)
 => (s :: <string>)
  let (hours, minutes, seconds) = decode-total-seconds(t);
  let hh = integer-to-string(hours);
  let mm = integer-to-string(minutes, size: 2);
  concatenate(hh, ":", mm)
end;

define method as
    (class == <string>, time :: <time-offset>)
 => (s :: <string>)
  let sign = if (past?(time)) "minus" else "plus" end;
  concatenate(sign, " ", next-method())
end method as;

define method past?
    (time :: <time-offset>) => (past? :: <boolean>)
  time.total-seconds < 0
end;

define method \+
    (offset1 :: <time-offset>, offset2 :: <time-offset>)
 => (sum :: <time-offset>)
  let sum = offset1.total-seconds + offset2.total-seconds;
  make(<time-offset>, total-seconds: sum)
end method \+;

define method \+
    (offset :: <time-offset>, time-of-day :: <time-of-day>)
 => (sum :: <time-of-day>)
  make(<time-of-day>,
       total-seconds: offset.total-seconds + time-of-day.total-seconds)
end method \+;

define method \+
    (time-of-day :: <time-of-day>, offset :: <time-offset>)
 => (sum :: <time-of-day>)
   offset + time-of-day
end method \+;
