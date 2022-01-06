Module: time
Synopsis: A specific time of day from 00:00 (midnight) to below 24:00
          (tomorrow)
Author:   Fernando Raya
License:  See LICENSE

define class <time-of-day> (<object>)
  slot total-seconds :: <integer>, init-keyword: total-seconds:;
end class <time-of-day>;

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
    (time :: <time-of-day>)
 => (hours :: <integer>, minutes :: <integer>, seconds :: <integer>)
  decode-total-seconds(time.total-seconds);
end method decode-total-seconds;

define method as
    (class == <string>, t :: <time-of-day>)
 => (s :: <string>)
  let (hours, minutes, seconds) = decode-total-seconds(t);
  let hh = integer-to-string(hours);
  let mm = integer-to-string(minutes, size: 2);
  concatenate(hh, ":", mm)
end;

define method say-time-of-day
    (time :: <time-of-day>) => ()
  let (hours, minutes, seconds) = decode-total-seconds(time);
  format-out("%d:%s%d", hours, if (minutes < 10) "0" else "" end, minutes);
end method say-time-of-day;

define class <time-offset> (<object>)
  slot total-seconds :: <integer>, init-keyword: total-seconds:;
end class <time-offset>;

define method past?
    (time :: <time-offset>) => (past? :: <boolean>)
  time.total-seconds < 0
end;

define method decode-total-seconds
    (time :: <time-offset>)
 => (hours :: <integer>, minutes :: <integer>, seconds :: <integer>)
  decode-total-seconds(abs(time.total-seconds))
end;

define method say-time-offset
    (time :: <time-offset>) => ()
  let (hours, minutes, seconds) = decode-total-seconds(time);
  format-out("%s %d:%s%d",
             if (past?(time)) "minus" else "plus" end,
	     hours,
	     if (minutes < 10) "0" else "" end,
	     minutes);
end method say-time-offset;

define method as
    (class == <string>, time :: <time-offset>)
 => (s :: <string>)
  let (hours, minutes, seconds) = decode-total-seconds(time);
  let sign = if (past?(time)) "minus" else "plus" end;
  let hh   = integer-to-string(hours);
  let mm   = integer-to-string(minutes, size: 2);
  concatenate(sign, " ", hh, ":", mm)
end method as;
 
