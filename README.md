# ruby-simple-dev-env

Ruby + Rack + Puma + Nginx でつくったシンプルな開発環境。

- Nginx <-> Puma はソケット通信を行っている
- `/app`と`/config`配下を監視、オートリロードが可能
  - `gem listen`で特定のディレクトリを監視、変更のタイミングで`/tmp/restart.txt`のタイムスタンプを更新
  - `plugin :tmp_restart`で`/tmp/restart.txt`を監視
  - `compose.yaml`の`command`でこれらをバックグラウンド実行
