- メールの送信にかんするあれやこれやの機能を提供してくれるサーバーのこと
- メールを送り先に移動させるのが仕事のコンピュータ
- メールサーバは二種類
- メールを送くるときに使うサーバー
- メールを受け取る時に使うサーバー

- メールを送る時に使うサーバが「SMTPサーバ」
- メールを送る時は、書いたメールをSMTPサーバに渡す。
- SMTPサーバーはあなたのメールを相手に配達してくれる。
- SMTPは「通信する上でのお約束ごとの一つで、メール送信に関するお約束ごと」

- メールを受け取る時に使うサーバは「POPサーバ」

- 以下詳しく
- メールをそう維新する時、パソコンから出発したメールは、まずSMTPサーバに到着する。
- このときのやりとりは「SMTP」というお約束ごとに従って行われる。
- パソコンからSMTPサーバに送られたメールは、さらに別のSMTPサーバに送られる。
- さらに、いくつかのSMTPサーバを経由した後、メールは目的地のSMTPサーバに到着する。
- 目的地のSMTPサーバは、受け取ったメールをダンボール箱に入れて保管する。
- これでとりあえず、送り先に到着する。

- メールの移動はSMTPサーバのみを介して行われる。
- この間、POPサーバは登場しない。
- 送り先側でメールを受け取るのもSMTPサーバ

- さてピトタ君がパソコンをぽちぽちして、メールの受信操作を行いました。
- そうすると、パソコンからPOPサーバに対して新しいメールは来てる？という問い合わせがいく。
- POPサーバは、先ほどの届いていたSMTPサーバをガサゴソ漁って、ピヨ田君宛のメールが来ていれば、パソコンに渡してあげる。

- なお、パソコンとPOPサーバの間のやり取りは「POP3」というお約束ごとに従って行われる。
- 送られたメールの移動は、基本的にSMTPサーバさんが行います。
- 移動し終わったらメールをパソコンさんに渡してやるのが、POPサーバさんの役割です。
- メールを送る時は、送り元のSMTPサーバから送り先のPOPサーバに届くのではありません。
- 送り元のSMTPサーバから送り先のSMTPサーバに届き、それを送り先のPOPサーバがパソコンにお届けます。

- 要するに「SMTPサーバ」って単語が出てきたら「メールを送る時に頑張ってくれるコンピューターなんだな〜」って考えれば良い。
