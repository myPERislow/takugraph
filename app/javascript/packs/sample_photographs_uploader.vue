<template>
  <div>
    <div class="card-panel">
      <div class="row">
        <div @dragenter="$event.dataTransfer.dropEffect = 'copy'"
             @dragover="$event.dataTransfer.dropEffect = 'copy'"
             @drop="onFileChanged"
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
