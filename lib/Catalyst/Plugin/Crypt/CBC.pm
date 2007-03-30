package Catalyst::Plugin::Crypt::CBC;

use strict;
use warnings;
use Crypt::CBC;

our $VERSION = '0.01';

sub crypt_cbc {
        my $c = shift;
        return Crypt::CBC->new( $c->config->{crypt_cbc} );
}

1;
__END__

=head1 NAME

Catalyst::Plugin::Crypt::CBC - Crypt::CBC plugin for Catalyst.

=head1 SYNOPSIS

  use Catalyst qw/Crypt::CBC/;

  # Set option - sample
  MyApp->config->{crypt_cbc} = {
    key => 'my secret key',
    cipher => 'Blowfish', # this sample need Crypt::Blowfish
  }

  # Set option - anothor sample
  MyApp->config->{crypt_cbc} = {
    key => 'my secret key',
    cipher => 'Blowfish',
    iv => '$KJh#(}q',
    regenerate_key => 0,
    padding => 'space',
    prepend_iv => 0,
  }

  # Use Crypt::CBC objects within your Catalyst app:
  my $crypt = $c->crypt_cbc(); # will return a Crypt::CBC object

  my $plaintext = 'Hello';
  my $ciphertext = $crypt->encrypt_hex($plaintext); #53616c7465645f5fa42e58c38281a94fe591200d18dc335f
  my $return_plain_text = $crypt->decrypt_hex($ciphertext); #Hello

  # Example when Catalyst::View::TT
  <a href="uri?id=[% Catalyst.crypt_cbc.encrypt_hex(user_id) %]">user_name</a>

=head1 DESCRIPTION

This plugin is to make the wonders of L<Crypt::CBC> easily accesible within 
a L<Catalyst> application via the L<Catalyst::Plugin> interface.
See L<Crypt::CBC> for more information.

=head1 METHOD

=head2 crypt_cbc

Returns a L<Crypt::CBC> object.  If params are argued they will be passed to the 
C<< Crypt::CBC->new() >> method.

=head1 SEE ALSO

L<Catalyst>, L<Crypt::CBC>
 
=head1 AUTHOR

Kazuma Shiraiwa

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2007 by Kazuma Shiraiwa.
This program is free software; you may redistribute it and/or modify it
under the same terms as Perl itself.

=cut
