#Star Topology
set ns [new Simulator]

$ns color 1 Green
$ns color 2 Red
$ns color 3 Blue
$ns color 4 Yellow

set nf [open out1.nam w]
$ns namtrace-all $nf

proc finish {} {
global ns nf
$ns flush-trace
close $nf
exec nam out1.nam &
exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n0 $n3 1Mb 10ms DropTail
$ns duplex-link $n0 $n4 1Mb 10ms DropTail

set tcp0 [new Agent/TCP]
$tcp0 set class_ 2
set sink0 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp0
$ns attach-agent $n1 $sink0
$ns connect $tcp0 $sink0
set ftp0 [new Application/FTP]
$ftp0 set type_ FTP
$ftp0 attach-agent $tcp0
$tcp0 set fid_ 1

set tcp1 [new Agent/TCP]
$tcp1 set class_ 2
set sink1 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp1
$ns attach-agent $n2 $sink1
$ns connect $tcp1 $sink1
set ftp1 [new Application/FTP]
$ftp1 set type_ FTP
$ftp1 attach-agent $tcp1
$tcp1 set fid_ 2

set tcp2 [new Agent/TCP]
$tcp2 set class_ 2
set sink2 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp2
$ns attach-agent $n3 $sink2
$ns connect $tcp2 $sink2
set ftp2 [new Application/FTP]
$ftp2 set type_ FTP
$ftp2 attach-agent $tcp2
$tcp2 set fid_ 3

set tcp3 [new Agent/TCP]
$tcp3 set class_ 2
set sink3 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp3
$ns attach-agent $n4 $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 set type_ FTP
$ftp3 attach-agent $tcp3
$tcp3 set fid_ 4

$ns at 0.2 "$ftp0 start"
$ns at 0.4 "$ftp1 start"
$ns at 0.6 "$ftp2 start"
$ns at 0.8 "$ftp3 start"
$ns at 2.2 "$ftp0 stop"
$ns at 2.4 "$ftp1 stop"
$ns at 2.6 "$ftp2 stop"
$ns at 2.8 "$ftp3 stop"
$ns at 3.0 "finish"

$ns run
