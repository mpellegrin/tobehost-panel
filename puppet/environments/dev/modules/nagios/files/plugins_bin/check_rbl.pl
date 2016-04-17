#!/usr/bin/perl
#
# check_rbl : check that the IP is not on any of the RBL lists
#             DO NOT run this more often than every 1 hour since it would
#             cause undue load on the RBL servers
#
# Steve Shipway, University of Auckland, 2006
# http://www.steveshipway.org/software
#
# Usage:  check_rbl ip-address
#
# Version: 1.1 - Parameter can be hostname as well as IP address.

use strict;
my($IP,$PFX);
my($MSG,$STATUS);
my($DOM,$URL,$DESC);
my($rv);

##############################################################################
# Blacklists
my( @BLACKLISTS ) = (
	# DNS blackhole domain, name, optional website address
# NJABL has now been superceded by pbl.spamhaus
#	[ "combined.njabl.org",        "NJA Blacklist", "http://www.njabl.org/" ],
# OpenRBL now only allow HTTP queries, and rate limit them, so we cant check
# them using this plugin.
#	[ "openrbl.org",        "OpenRBL Blacklist", "http://www.openrbl.org/" ],
	[ "dnsbl.sorbs.net",           "SORBS", "http://www.sorbs.net/" ],
	#[ "list.dsbl.org",             "Distributed Sender", "http://dsbl.org/" ],
	[ "zen.spamhaus.org",      "Spamhaus SBL/XBL/PBL", "http://www.spamhaus.org/" ],
	#[ "fuldom.rfc-ignorant.org",   "RFC-Ignorant", "http://www.rfc-ignorant.org/" ],
	[ "bl.spamcop.net",            "SpamCop", "http://www.spamcop.net/" ],
	#[ "blackholes.mail-abuse.org", "Mail-abuse.org", "http://www.mail-abuse.org/" ]
	[ "ers.trendmicro.com", "ERS Trend Micro", "http://ers.trendmicro.com/" ]
);

##############################################################################
# Functions
sub checkdom($) {
	my($n,$a,$at,$l,@ad) = gethostbyname($PFX.".".$_[0]);
	my(@addr);
	return 0 if(!$n);
	@addr = unpack('C4',$ad[0]);
	return $addr[3];
}

##############################################################################
# MAIN

shift @ARGV if($ARGV[0] and $ARGV[0] eq '-H');
if(!$ARGV[0]) {
	print "Usage: check_rbl ipaddress\n";
	exit 3; # Unknown
}
if( $ARGV[0]=~/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/ ) {
	$PFX = "$4.$3.$2.$1";
	$IP = $ARGV[0];
} else {
	# Resolve a host name
	my ( $lhname, $aliases, $addrtype, $length,  @addrs)
         = gethostbyname( $ARGV[0] );
 	$IP = $addrs[0];
	if(!$IP) {
		print "Hostname ".$ARGV[0]." does not resolve.\n";
		exit 3;
	}
	$IP=~/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/ ;
	$PFX = "$4.$3.$2.$1";
}

$STATUS = 0; $MSG = "";
foreach ( @BLACKLISTS ) {
	($DOM,$DESC,$URL) = @$_;
	$rv = checkdom($DOM);
	if($rv) {
		$MSG .= "<BR>" if($MSG);
		$MSG .= "Listed on ";
		$MSG .= "<A HREF=\"$URL\">" if($URL);
		$MSG .= $DESC;
		$MSG .= "</A>" if($URL);
		$MSG .= "($rv)";
		$STATUS = 2; # Critical!
	}
}

if(!$MSG) { 
	$MSG = "";
	foreach ( @BLACKLISTS ) {
		($DOM,$DESC,$URL) = @$_;
		$MSG .= ", " if($MSG);
		$MSG .= $DESC;
	}
	$MSG = "All OK: $MSG";
}

print "$MSG\n";
exit $STATUS;
