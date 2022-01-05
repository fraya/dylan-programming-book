Module: time-test
Author: Fernando Raya
License: See LICENSE

define test test-encode-total-seconds ()
  let seconds = encode-total-seconds(8, 30, 59);
  assert-equal(30659, seconds)
end test;

define test test-decode-total-seconds ()
  assert-equal(values(8, 30, 59), decode-total-seconds(30659))
end test;

define test test-decode-total-seconds-time ()
  let t = make(<time-of-day>, total-seconds: 30659);
  assert-equal(values(8, 30, 59), decode-total-seconds(t))
end test;

define test test-encode-decode ()
  let sec1    = 30659;
  let (h,m,s) = decode-total-seconds(sec1);
  let sec2    = encode-total-seconds(h, m, s);
  assert-equal(sec1, sec2)
end test;

define test test-print-object-time-of-day ()
  let t1 = make(<time-of-day>, total-seconds: 30659);
  assert-equal("8:30", as(<string>, t1));
  let t2 = make(<time-of-day>, total-seconds: 29399);
  assert-equal("8:09", as(<string>, t2));
end test;

define suite time-test-suite ()
   test test-encode-total-seconds;
   test test-decode-total-seconds;
   test test-print-object-time-of-day;
end;

run-test-application();
