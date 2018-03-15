<script src="./sample_photographs_uploader.js"></script>

<template>
  <div>
    <div class="card-panel">
      // テキスト
      // データバインディングの最も基本的な形式は、"Mustache"構文(二重中括弧)を使用するテキスト展開です
      // <span>Message: {{ msg }}</span>
      // mustacheタグは対応するデータオブジェクト内のmsgプロパティの値に置き換えられます
      // また、データオブジェクトの`msg`プロパティが変更される時、それに応じて常に変更される
      <h4>納品写真の選択(現在{{ numberOfImages }}枚)</h4>
      <p>※{{ numberOfSamplePhotographsLowerLimit }}枚以上、{{ numberOfSamplePhotographsUpperLimit }}枚まで納品できます。</p>
      <p>既に納品済みのサンプル写真：{{ album.numberOfPersistedSamplePhotographs }}枚</p>
      // 条件付きレンダリング
      // v-if
      // 文字列テンプレートでは、例えばHandlebarsの例は、このような条件ブロックを記述します
      // <!-- Handlebars の例 -->
      // {{#if ok}}
      //   <h1>Yes</h1>
      // {{/if}}
      // Vue.jsでは、同じことを達成するために、`v-if`ディレクティブを使用します
      // <h1 v-if="ok">Yes</h1>
      // これは、`v-else`で"elseブロック"を追加することも可能です
      // <h1 v-if="ok">Yes</h1>
      // <h1 v-else>No</h1>
      <p v-if="numberOfImages < numberOfSamplePhotographsLowerLimit" class="error">納品枚数が足りません</p>
      <p v-if="numberOfImages > numberOfSamplePhotographsUpperLimit" class="error">納品枚数が多すぎます</p>
      <p v-if="isInvalidAspectRatio" class="error">3:2ではない画像が含まれています</p>
      <div class="row">
        // ネイティブHTML5ドラッグ＆ドロップ
        // ドラッグ イベントをリッスンする
        // ドラッグ＆ドロップ プロセス全体を監視する、以下のような様々なイベントをアタッチできる
        // dragstart
        // drag
        // dragenter
        // dragleave
        // dragover
        // drop
        // dragend
        // DnDフローを処理するには、ソース要素(ドラッグが始まる場所)、データペイロード(ドロップするもの)、ターゲット(ドロップを受け取る領域)の概念が必要です
        // ソース要素は、画像、リスト、リンク、ファイルオブジェクト、HTMLのブロックなど様々です
        // ターゲットは、ユーザーがドロップするデータを受け取る1つまたは複数のドロップゾーンです
        // ターゲットにすることができない要素(画像など)がある点に注意してください
        // 1. ドラッグを開始する
        // コンテンツにdraggable="true"属性を定義してから、dragstartイベントハンドラをアタッチして、格列のDnDのシーケンスを開始ます
        // ユーザーがドラッグを開始したら、次のコードで列の不透明度を40%に設定します
        // ```
        // function handleDragStart(e) {
        //   this.style.opacity = '0.4'; // this / e.target is the source node.
        // }
        // var cols = document.querySelectorAll('#columns .column'); // ElemntのquerySelectorAll()メソッドは、与えられたCSSセレクタにマッチする文書中の要素のリストを示す静的なNodeListを返す
        // [].forEach.call(cols, function(col) { // forEachは与えられた関数を、配列の各要素に対して一度ずつ実行します
        //   col.addEventListener('dragstart', handleDragStart, false);
        //  });
        // EventTarget.addEventListener()は、EventTargetのイベントリスナーリストに、引数で渡されたEventListenerオブジェクトを追加します
        // イベントターゲットは、ドキュメント上のElement、Document自身、Window、あるいはイベント機構をサポートしているあらゆるオブジェクト(XMLHttpRequestなど)です。
        // target.addEventListener(type, listener[, options]);
        // type: 対象とするイベントの種類を表す文字列
        // listener: 指定されたタイプのイベントが発生するときに通知を受け取るオブジェクト
        // これは、EventListenerインターフェースを実装するオブジェクト、あるいは、単純に、JavaScriptの関数でなければなりません
        // options: 対象のイベントリスナーの特性を指定する
        // capture: イベントをDOMツリーで下に位置するEventTargetに発送される前に受け取りたいかを指定するBoolean
        // ```
        // dragstartイベントのターゲットはソース内容なので、this.style.opacityを40%に設定することにより、この要素が現在移動している選択内容であるという視覚的なフィードバックをユーザーに与える
        // 必要な処理のうち残っているものは、ドラッグの完了時に列の不透明度を100%に戻すことだけです。
        // この処理を行う場所は、dragendイベントです
        // この処理については、あとで詳しく説明します
        // 2. dragenter, dragover, dragleave
        // dragenter, dragover, dragleaveイベントハンドラを使用すると、ドラッグプロセス中に視覚による追加的な合図を提供することができる
        // 例えば、ドラッグ中にカーソルが列に移動されるとボーダーを点線にするということが可能になります
        // これによって、列もドロップターゲットであることをユーザーに示すことができる
        <div @dragenter="$event.dataTransfer.dropEffect = 'copy'"
             // @dragenterはv-on:dragenterの省略系であり、v-on:draggble="~~~"は、drabbleイベントが発生したときに、"~~"での処理を呼び出す。
             //dragenterイベントが生じたときに、copyが行われる
             @dragover="$event.dataTransfer.dropEffect = 'copy'"
             //dragoverイベントが生じたときに、copyが行われる
             // dataTransfer.dropEffect
             // dragenterおよびdragoverイベント中にユーザーに与えるフィードバックを制限します
             // ユーザーがターゲット要素にカーソルを移動すると、ブラウザのカーソルは実行する操作(コピー、移動など)の種類を示す形に変わります
             // この効果では、none, copy, link, moveのいずれかの値を処理できます
             @drop="onFileChanged"
             //dropした瞬間にこの関数が働いて、
             class="upload-field">
          <uploader v-for="(file, index) in files"
          　　　　　　:key="file.name"
                    :author="author"
          　　　　　　:file="file"
                    :index="index"
          　　　　　　:retouched="retouched"
                    :event-hub="eventHub"
          　　　　　　class="preview col l2 s3">
          </uploader>
          <div class="clearfix"></div>
          <div class="upload-description">
            <div class="small">
              ファイルをここにドラッグ&ドロップしてください
            </div>
          </div>
        </div>
        <p>
          納品したいファイルを上の枠線の中にドラッグ&ドロップした後、下の納品ボタンを押してください。(複数ファイルも可)
          <br>
          もしくはこちらからファイルを選択してください。
          <br>
          <input @change="onFileChanged" accept="image/*" id="upload-field" multiple name="upload-field" type="file">
        </p>
      </div>
    </div>
  </div>
</template>
