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

define method say-time-of-day
  (time :: <time-of-day>)
  => ()
  let(hours, minutes, seconds) = decode-total-seconds(time);
  format-out("%d:%s%d", hours, if (minutes < 10) "0" else "" end, minutes);
end method say-time-of-day;

define function main
  (name :: <string>, arguments :: <vector>)
  let seconds = encode-total-seconds(8, 30, 59);
  let my-time = make(<time-of-day>, total-seconds: seconds);
  say-time-of-day(my-time);
  exit-application(0);
end function main;

main(application-name(), application-arguments());
