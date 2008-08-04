require 'test_helper'

class InviteMailerTest < ActionMailer::TestCase
  tests InviteMailer
  def test_invite
    @expected.subject = 'InviteMailer#invite'
    @expected.body    = read_fixture('invite')
    @expected.date    = Time.now

    assert_equal @expected.encoded, InviteMailer.create_invite(@expected.date).encoded
  end

  def test_sent
    @expected.subject = 'InviteMailer#sent'
    @expected.body    = read_fixture('sent')
    @expected.date    = Time.now

    assert_equal @expected.encoded, InviteMailer.create_sent(@expected.date).encoded
  end

end
