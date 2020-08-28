# s3d: S3 Deploy
## Description

Deploy all files and directories to S3 for static website hosting.

S3にファイルを上げて静的サイトとして公開するだけなら、そのためのサービスやら何やら使わなくても、シェルでいーんじゃねーの、と思って作った。
一々新たな技術を身に付ける必要が生じる現代のWeb開発にムシャクシャしているのも作った理由として大きい。
実用性があるかどうかは知らない。実用するつもりもない。動作確認すらしてない。

## Dependencies

* Bash
* AWS CLI

## Usage

1. Copy `s3d.sh` and `s3d.conf` to your repository.
2. Edit `s3d.conf` .
3. Execute `s3d.sh` .
