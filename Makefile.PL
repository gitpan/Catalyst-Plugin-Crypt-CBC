use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'Catalyst::Plugin::Crypt::CBC',
    VERSION_FROM      => 'lib/Catalyst/Plugin/Crypt/CBC.pm',
    PREREQ_PM         => {
        'Test::More'  => '0',
        'Catalyst'    => '2.99',
        'Crypt::CBC'  => '2.01',
    },
);
