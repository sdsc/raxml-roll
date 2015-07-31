#!/usr/bin/perl -w
# raxml roll installation test.  Usage:
# raxml.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/raxml';
my $output;

my $TESTFILE = 'tmpraxml';

# raxml-base.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'raxml installed');
} else {
  ok(! $isInstalled, 'raxml not installed');
}

# garli
SKIP: {

  skip 'garli not installed', 4 if ! -d '/opt/garli';

  open(OUT, ">$TESTFILE.garli.sh");
  print OUT <<END;
module load garli
/bin/mkdir $TESTFILE.garli.dir
cd $TESTFILE.garli.dir
/bin/cp -r \$GARLIHOME/example/basic/* .
Garli 1
END
  $output = `/bin/bash $TESTFILE.garli.sh 2>&1`;
  like($output, qr/Saving final tree/, 'garli test run');

  `/bin/ls /opt/modulefiles/applications/garli/[0-9]* 2>&1`;
  ok($? == 0, 'garli module installed');
  `/bin/ls /opt/modulefiles/applications/garli/.version.[0-9]* 2>&1`;
  ok($? == 0, 'garli version module installed');
  ok(-l '/opt/modulefiles/applications/garli/.version',
     'garli version module link created');

}

# mafft
SKIP: {

  skip 'mafft not installed', 4 if ! -d '/opt/mafft';

  $output = `module load mafft; mafft \$MAFFTHOME/test/samplerna > $TESTFILE.mafft 2>/dev/null; /usr/bin/cmp \$MAFFTHOME/test/samplerna.qinsi $TESTFILE.mafft 2>&1`;
  ok($? == 0, 'mafft test run');

  `/bin/ls /opt/modulefiles/applications/mafft/[0-9]* 2>&1`;
  ok($? == 0, 'mafft module installed');
  `/bin/ls /opt/modulefiles/applications/mafft/.version.[0-9]* 2>&1`;
  ok($? == 0, 'mafft version module installed');
  ok(-l '/opt/modulefiles/applications/mafft/.version',
     'mafft version module link created');

}

# raxml
SKIP: {

  skip 'raxml not installed', 4 if ! -d '/opt/raxml';

  # Example from http://sco.h-its.org/exelixis/web/software/raxml/hands_on.html
  open(OUT, ">$TESTFILE.binary.phy");
  print OUT <<END;
10 44
t1	0110111100 0001000? 0000000000 0000100110 011010
t2	0110111100 00010011 0000000000 0000100100 101010
t3	0110111100 00010011 0000000000 0000100100 101010
t4	0110111100 00010011 0000000000 0000100100 101010
t5 	0110111110 00101101 111?0?0000 0000110000 010100
t6 	0110111110 00101101 1111001000 0000010000 010001
t7 	0110111110 00101101 1111000000 0010100000 010000
t8	0110111110 00101101 111?001000 0010100000 010010
t9	0110111110 00101101 11010??000 0000100000 010010
t10 	0110111110 00101100 0001011000 0000100000 010010
END
  close(OUT);
  $output = `module load raxml; raxmlHPC -m BINGAMMA -p 12345 -s $TESTFILE.binary.phy -n T1 2>&1`;
  like($output, qr/best tree -119/, 'raxml test run');

  `/bin/ls /opt/modulefiles/applications/raxml/[0-9]* 2>&1`;
  ok($? == 0, 'raxml module installed');
  `/bin/ls /opt/modulefiles/applications/raxml/.version.[0-9]* 2>&1`;
  ok($? == 0, 'raxml version module installed');
  ok(-l '/opt/modulefiles/applications/raxml/.version',
     'raxml version module link created');

}

`rm -fr $TESTFILE* RA*`;
