use strict;
use warnings;

my $app_id = $ENV{FB_APP_ID} || '110714119002701';
unless ($app_id) {
    print "Enter your Application ID: ";
    chomp( $app_id = <STDIN> );
}

# create oauth url
my $url = sprintf 'https://www.facebook.com/dialog/oauth?client_id=%s&redirect_uri=http://www.facebook.com/connect/login_success.html', $app_id;
$url .= '&scope=publish_stream,offline_access';
$url .= '&response_type=token';

# open the browser
my $open = $^O =~ m/darwin/xms ? 'open' : $^O =~ m/MSWin/xms  ? 'start' : "";
if ($open) {
    print "open facebook url...: $url\n";
    system $open, $url;
} else {
    print "please open facebook url: $url\n";
}

# create .shipit.facebook template
my $detect_url;
while (1) {
    print "please enter URL after facebook login (e.g: http://www.facebook.com/connect/login_succe...)\n : ";
    chomp( $detect_url = <STDIN> );
    next unless $detect_url =~ m{\Ahttp://www.facebook.com/connect/login_success.html#access_token=};
    last;
}

my($access_token) = $detect_url =~ /\#access_token=(.+)&/;

print <<END;
please write in the ~/.shipit.facebook file:

    access_token: "$access_token"
    target: me

END
