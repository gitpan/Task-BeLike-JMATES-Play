#!perl

use 5.010000;

use strict;
use warnings;
use ExtUtils::MakeMaker;
use File::Spec ();

my %params = (
  NAME         => 'Task::BeLike::JMATES::Play',
  ABSTRACT     => 'modules used by JMATES (not for work)',
  VERSION_FROM => 'lib/Task/BeLike/JMATES/Play.pm',
  PREREQ_PM    => {
    'Any::Moose'                     => 0,
    'App::Ack'                       => 0,
    'App::MusicTools'                => 0,
    'App::cpanminus'                 => 0,
    'Astro::Sunrise'                 => 0,
    'Data::Dumper::Concise'          => 0,
    'Data::Dumper::Concise::Aligned' => 0,
    'DateTime'                       => 0,
    'DateTime::Format::Epoch'        => 0,
    'DateTime::Format::Strptime'     => 0,
    'DBD::SQLite'                    => 0,
    'Devel::NYTProf'                 => 0,
    'File::AtomicWrite'              => 0,
    'File::Cmp'                      => 0,
    'File::HomeDir'                  => 0,
    'File::Path::Tiny'               => 0,
    'Hailo'                          => 0,
    'Image::Size'                    => 0,
    'JSON'                           => 0,
    'LWP::UserAgent'                 => 0,
    'MIDI::Simple'                   => 0,
    'Math::Combinatorics'            => 0,
    'Math::Random::Discrete'         => 0,
    'Moo'                            => 0,
    'Music::NeoRiemannianTonnetz'    => 0,
    'Perl::Tidy'                     => 0,
    # build failures os x :(
    #   'POSIX::strptime'                => 0,
    'Term::CallEditor'    => 0,
    'Term::ReadKey'       => 0,
    'Term::ReadLine::Gnu' => 0,
    'Text::Autoformat'    => 0,
    'Text::Levenshtein'   => 0,
    'Text::Metaphone'     => 0,
    'Text::WagnerFischer' => 0,
    'Time::HiRes'         => 0,
    'URI'                 => 0,
  },
  ( $] >= 5.005
    ? ( AUTHOR => 'Jeremy Mates <jmates@cpan.org>' )
    : ()
  ),
);

# for xpquery, on wild assumption that libxml2 is available
for my $d ( split /[:]+/, $ENV{PATH} || '' ) {
  next if length $d == 0;
  if ( -x File::Spec->catfile( $d, 'xml2-config' ) ) {
    $params{PREREQ_PM}->{'XML::LibXML'}               = 0;
    $params{PREREQ_PM}->{'XML::LibXML::XPathContext'} = 0;
    last;
  }
}

if ( $ExtUtils::MakeMaker::VERSION =~ /^\d\.\d\d$/ and $ExtUtils::MakeMaker::VERSION > 6.30 ) {
  $params{LICENSE} = 'perl';
}

if ( $ExtUtils::MakeMaker::VERSION ge '6.46' ) {
  $params{META_MERGE} = {
    resources => {
      homepage   => 'http://github.com/thrig/Task-BeLike-JMATES-Play',
      license    => 'http://dev.perl.org/licenses/',
      repository => 'http://github.com/thrig/Task-BeLike-JMATES-Play',
    }
  };
}

if ( $ExtUtils::MakeMaker::VERSION ge '6.48' ) {
  $params{MIN_PERL_VERSION} = 5.010000;
}

WriteMakefile((MM->can('signature_target') ? (SIGN => 1) : ()), %params);
