Module:   time
Author:   Fernando Raya
License:  See LICENSE
Synopsis: Time module features.
          Depends on "./classes.dylan".

define method encode-total-seconds
    (max-unit :: <natural-number>,
     minutes  :: <natural-number>,
     seconds  :: <natural-number>)
 => (total-seconds :: <natural-number>)
  ((max-unit * 60) + minutes) * 60 + seconds;
end;

define method decode-total-seconds
    (total-seconds :: <integer>)
 => (hours :: <integer>, minutes :: <integer>, seconds :: <integer>)
  let(total-minutes, seconds) = truncate/(total-seconds, 60);
  let(hours, minutes) = truncate/(total-minutes, 60);
  values(hours, minutes, seconds)
end;

define method decode-total-seconds
    (sixty-unit :: <sixty-unit>)
 => (hours :: <integer>, minutes :: <integer>, seconds :: <integer>)
  decode-total-seconds(sixty-unit.total-seconds)
end;

define method decode-total-seconds
    (time :: <time>)
 => (hours :: <integer>, minutes :: <integer>, seconds :: <integer>)
  decode-total-seconds(abs(time.total-seconds));
end;

define method past?
    (time :: <time-offset>) => (past? :: <boolean>)
  time.total-seconds < 0
end;

/* 

  Time arithmetic (+) 

*/

define method \+
    (offset1 :: <time-offset>, offset2 :: <time-offset>)
 => (sum :: <time-offset>)
  make(<time-offset>,
       total-seconds: offset1.total-seconds + offset2.total-seconds)
end;

define method \+
    (offset :: <time-offset>, time-of-day :: <time-of-day>)
 => (sum :: <time-of-day>)
  make(<time-of-day>,
       total-seconds: offset.total-seconds + time-of-day.total-seconds)
end;

define method \+
    (time-of-day :: <time-of-day>, offset :: <time-offset>)
 => (sum :: <time-of-day>)
   offset + time-of-day
end;

/* 

  Conversion to <string> 

*/

define method as
    (class == <string>, t :: <time>)
 => (s :: <string>)
  let (hours, minutes, seconds) = decode-total-seconds(t);
  let hh = integer-to-string(hours);
  let mm = integer-to-string(minutes, size: 2);
  let ss = integer-to-string(seconds, size: 2);
  concatenate(hh, ":", mm, ":", ss)
end;

define method as
    (class == <string>, time :: <time-offset>)
 => (s :: <string>)
  let sign = if (past?(time)) "minus" else "plus" end;
  concatenate(sign, " ", next-method())
end;

define method as
    (class == <string>, angle :: <angle>)
 => (str :: <string>)
  let(degrees, minutes, seconds) = decode-total-seconds(angle);
  concatenate(integer-to-string(degrees), " degrees ",
	      integer-to-string(minutes), " minutes ",
	      integer-to-string(seconds), " seconds")
end;

define method as
    (class == <string>, angle :: <directed-angle>)
 => (str :: <string>)
  concatenate(next-method(), " ", as(<string>, angle.direction))
end;

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
end;

define method as
    (class == <string>, position :: <relative-position>)
 => (str :: <string>)
  concatenate(float-to-string(position.distance),
	      " miles away at heading ",
	      as(<string>, position.angle))
end;
