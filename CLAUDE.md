# CLAUDE.md

このファイルは、Claude Code (claude.ai/code) がこのリポジトリでコードを扱う際のガイダンスを提供します。

## リポジトリ構造

これは、Lazy.nvimプラグインマネージャーを使用したAstroNvim v5フレームワークベースのNeovim設定です。特殊なキーボードレイアウトに適応したカスタムキーバインドを含むモジュラーアーキテクチャを使用しています。

### 設定アーキテクチャ

**ブートストラップ (`init.lua`):**
- Lazy.nvimのインストールとセットアップを実行
- メイン設定モジュール（`lazy_setup`、`polish`）を読み込み
- 重要なファイル - 必要でない限り編集を避ける

**プラグイン管理 (`lua/lazy_setup.lua`):**
- AstroNvim v5をベースディストリビューションとしてLazy.nvimを設定
- コミュニティプラグインとカスタムプラグイン設定をインポート
- プラグイン読み込み順序を設定: AstroNvim → community → custom plugins

**コアモジュール:**
- `lua/community.lua` - AstroCommunityプラグインインポート（現在無効化）
- `lua/polish.lua` - 他に当てはまらない最終セットアップとカスタマイゼーション
- `lua/plugins/` - 個別プラグイン設定とオーバーライド

## 主要なアーキテクチャパターン

### プラグイン設定構造
`lua/plugins/`内の各プラグイン設定はLazySpec形式に従います：
- 遅延読み込み設定を含むプラグイン仕様
- AstroNvimデフォルトのオーバーライド設定
- 特定のセットアップ関数を持つカスタムプラグイン追加

### カスタムキーバインドレイアウト
設定では特殊なキーボードレイアウトによるリマップされたキーを使用：
- `d/h/t/n` を `h/j/k/l`（ナビゲーション）にマップ
- `a` を `d`（削除操作）にマップ
- `c` を `r`（置換操作）にマップ
- `e` を `a`（追加操作）にマップ

### 言語サーバー設定
- LSPセットアップは主に `lua/plugins/astrolsp.lua` で処理
- `polish.lua` でカスタムVolar（Vue.js）設定
- 自動ツールインストール用のMason統合

## よく使うコマンド

### プラグイン管理
```bash
# Neovimを起動してプラグインを更新
nvim
:Lazy update

# プラグインステータスを確認
:Lazy

# プラグインを同期（未使用を削除、不足を追加）
:Lazy sync
```

### 設定のリンク
```bash
# dotfilesリポジトリから設定をリンク
./vimlink.sh  # 注意: このスクリプトは古く、古いvimファイルをリンクします

# 現在の設定はnvim/ディレクトリ内で独立しています
```

### 言語サーバー管理
```bash
# Neovim内 - LSPサーバー管理
:Mason
:MasonUpdate
:LspInfo
```

## ファイル構成

### コア設定ファイル
- `init.lua` - エントリーポイントとLazy.nvimブートストラップ
- `lua/lazy_setup.lua` - メインLazy.nvim設定
- `lua/polish.lua` - 最終カスタマイゼーションと後セットアップ設定

### プラグイン設定
- `lua/plugins/astrocore.lua` - AstroNvimコア設定、オプション、キーマップ
- `lua/plugins/user.lua` - カスタムプラグイン追加と豊富なテーマ設定
- `lua/plugins/astrolsp.lua` - 言語サーバー設定
- `lua/plugins/astroui.lua` - UIカスタマイゼーション
- `lua/plugins/heirline.lua` - ステータスライン設定

### テーマと美観
設定には豊富なテーマサポートが含まれます：
- 複数のカラースキーム: Catppuccin (macchiato)、Material、Nord、Tokyo Night、Monokai Proなど
- カスタムカラーオーバーライドと透明背景オプション
- ステータスライン、通知、UIコンポーネント用の統合テーマサポート

## 開発ワークフロー

### 設定変更
- `nvim/`ディレクトリ内でファイルを直接編集
- Neovimを再起動または`:source`で設定を再読み込み
- 設定の問題を診断するため`:checkhealth`を使用

### 新しいプラグインの追加
1. `lua/plugins/`内の適切なファイルにプラグイン仕様を追加
2. 適切な遅延読み込み設定でLazySpec形式に従う
3. 必要に応じてセットアップ関数と依存関係を含める

### カスタムキーバインド
- 主要なキーバインドは `lua/plugins/astrocore.lua` で定義
- 複雑なセットアップ用の追加マッピングは `lua/polish.lua` で定義
- リーダーキー: `<Space>`、ローカルリーダーキー: `,`

### 言語サポート
- `polish.lua` でPerl固有のインデントとキーワード設定
- カスタムVolar設定によるVue.js/TypeScriptサポート
- 言語サーバーとツールの自動インストールはMasonで処理

## 重要な注意事項

### キーボードレイアウト適応
この設定は非QWERTYキーボードレイアウトに特別に適応されています。新しいキーバインドを追加する際は、`d/h/t/n`が標準Vimナビゲーションに対応する既存のリマッピングスキームを考慮してください。

### プラグイン読み込み戦略
- AstroNvim v5をベースフレームワークとして使用
- コミュニティプラグインは現在無効化されているが、簡単な有効化が可能に設定
- `user.lua`で多くのテーマと機能プラグインによる重いカスタマイゼーション
- 遅延読み込みと無効化されたデフォルトプラグインによるパフォーマンス最適化

### AI統合
- カスタム受け入れキーバインド（`<C-h>`）によるGitHub Copilot統合
- 複数プロバイダーサポート（Copilot、Claude、OpenAI）によるAIパワードコードアシスタンスのAvante.nvim
- 下部配置AIチャットインターフェース用に設定