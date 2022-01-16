Module: time
Synopsis: A specific time of day from 00:00 (midnight) to below 24:00
          (tomorrow)
Author:   Fernando Raya
License:  See LICENSE

define class <time> (<object>)
  slot total-seconds :: <integer>, init-keyword: total-seconds:;
end class <time>;

define class <time-of-day> (<time>)
end class <time-of-day>;

define class <time-offset> (<time>)
end class <time-offset>;

define method encode-total-seconds
    (hours :: <integer>, minutes :: <integer>, seconds :: <integer>)
 => (total-seconds :: <integer>)
  ((hours * 60) + minutes) * 60 + seconds;
end method encode-total-seconds;

define method decode-total-seconds
    (total-seconds :: <integer>)
 => (hours :: <integer>, minutes :: <integer>, seconds :: <integer>)
  let(total-minutes, seconds) = truncate/(total-seconds, 60);
  let(hours, minutes) = truncate/(total-minutes, 60);
  values(hours, minutes, seconds);
end method decode-total-seconds;

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

define generic say (any-object :: <object>) => ();

define method say
    (time :: <time>) => ()
  let (hours, minutes, seconds) = decode-total-seconds(time);
  format-out("%d:%s%d", hours, if (minutes < 10) "0" else "" end, minutes);
end method say;

define method past?
    (time :: <time-offset>) => (past? :: <boolean>)
  time.total-seconds < 0
end;

define method say
    (time :: <time-offset>) => ()
  format-out("%s ", if (past?(time)) "minus" else "plus" end);
  next-method();
end method say;

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
